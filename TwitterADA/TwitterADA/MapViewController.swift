//
//  MapViewController.swift
//  TwitterADA
//
//  Created by ifce on 15/09/17.
//  Copyright © 2017 ifce. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getMapViewFromURLRequest()
    }

   
    func getMapViewFromURLRequest() {
        
        let url = URL(string: "https://ios-twitter.herokuapp.com/api/v2/message")
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config, delegate: nil, delegateQueue: OperationQueue.main)
        
        let task = session.dataTask(with: request) { (data, response, erro) in
            
            if erro == nil {
                
                do {
                    
                    let fetchedData = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as! NSArray
                    
                    for eachFechedMessage in fetchedData {
                        
                        let eachData = eachFechedMessage as! [String: Any]
                        let txt = eachData["text"] as! String
                        let lati = eachData["lat"] as? Double
                        let long = eachData["long"] as? Double
                        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(lati!, long!)
                        
                        // Set Pin in Map
                        
                        let pin: MapPin = MapPin(text: txt, coordinate: location)
                        self.mapView.addAnnotation(pin)
                        self.mapView.showsCompass = true
                        self.mapView.setCenter(location, animated: true)
                        
                    }
    
                }
                catch {
                    print("Erro: \(erro!.localizedDescription)")
                }
            }
            else {
                print("Erro: \(erro!.localizedDescription)")
            }
        }
        task.resume()
    }


}
