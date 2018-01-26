//
//  MessagesController.swift
//  TwitterADA
//
//  Created by ifce on 11/09/17.
//  Copyright © 2017 ifce. All rights reserved.
//

import UIKit
import CoreLocation

class MessagesController: UITableViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var TwitterTableView: UITableView!
    var fetchedMessages = [Messages]()
    let locationManager = CLLocationManager()
    let geocoder = CLGeocoder()
    
    var messageInputted: UITextField!
    var latitudeInputted: UITextField!
    var longitudeInputted: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        listDataTableViewFromURLRequest()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func listDataTableViewFromURLRequest() {
        
        fetchedMessages = []
        
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
                        let id_ = eachData["_id"] as! String
                        let txt = eachData["text"] as! String
                        let lat = eachData["lat"] as? Double
                        let long = eachData["long"] as? Double
                        
                        self.fetchedMessages.append(Messages(id: id_, text: txt, latitude: lat ?? 0, longitude: long ?? 0))
                        
                        
                    }
                    //print(self.fetchedMessages)
                    
                    
                    self.TwitterTableView.reloadData()
                    
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
    
    func getCityName() {
    
        for message in fetchedMessages {
        
            let location = CLLocation(latitude: message.latitude, longitude: message.longitude)
        
            self.geocoder.reverseGeocodeLocation(location)  { (placemark, error) in
                
                if error != nil {
                    print("error")
                }
                else {
                    
                    let placeMark: CLPlacemark!
                    placeMark = placemark?[0]
                    
                    
                    let city = placeMark.addressDictionary!["City"] as? String
                    
                }
            }
        }
        
    
    }
    
    
    
    // Funcao para add texto, latitude e longitude com alert
    @IBAction func didTapAddMessage(_ sender: UIBarButtonItem) {
    
        let alert = UIAlertController(title: "Twitter ADA",
                                      message: "Input your message and location",
                                      preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addTextField(configurationHandler: messageInputtedTextField)
        alert.addTextField(configurationHandler: latitudeInputtedTextField)
        alert.addTextField(configurationHandler: longitudeInputtedTextField)
        
        
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
        let send = UIAlertAction(title: "Send", style: UIAlertActionStyle.default, handler: self.sendHandler)
        
        alert.addAction(cancel)
        alert.addAction(send)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func messageInputtedTextField(textField: UITextField!) {
        messageInputted = textField
        messageInputted?.placeholder = "Message"
    }
    
    func latitudeInputtedTextField(textField: UITextField!) {
        latitudeInputted = textField
        latitudeInputted?.placeholder = "Latitude"
    }
    
    func longitudeInputtedTextField(textField: UITextField!) {
        longitudeInputted = textField
        longitudeInputted?.placeholder = "Longitude"
    }
    
    // POST messages
    func sendHandler(alert: UIAlertAction!) {
        // Iniciando conexao para inserir os dados e configurando para o formato URLencoded
        let dados = "text=\(messageInputted.text!)&latitude=\(latitudeInputted.text!)&longitude=\(longitudeInputted.text!)"
        //let urlEncoded = dados.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        // Config URL Request
        let url = URL(string: "https://ios-twitter.herokuapp.com/api/v2/message")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = dados.data(using: .utf8)
    
        // Start Session
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, erro) in

            if erro == nil {
        
                let result = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                print(result)
        
            }
            else {
        
                print("Erro: \(erro!.localizedDescription)")
            
            }
                    
        }
        task.resume()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return fetchedMessages.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = TwitterTableView.dequeueReusableCell(withIdentifier: "MessageCell")

        cell?.textLabel?.text = fetchedMessages[indexPath.row].text
        cell?.detailTextLabel?.text = fetchedMessages[indexPath.row].city
        

        return cell!
    }
 
    
    override func viewWillAppear(_ animated: Bool) {
        TwitterTableView.reloadData()
    }
    
    // DELETE
    func deleleRowsTableView(inputId: String) {
        // Starting URL Request
        let url = URL(string: "https://ios-twitter.herokuapp.com/api/v2/message/\(inputId)")
        var request = URLRequest(url: url!)
        request.httpMethod = "DELETE"
        
        // Starting Session
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            if error == nil {
                
                print("DELETE Ok")
                
            }
            else {
                print("Erro: \(error!.localizedDescription)")
            }
        }
        task.resume()
    }
    
    // EDIT
    func editRowsTableView(editId: String) {
        // Iniciando conexao para inserir os dados e configurando para o formato URLencoded
        let dados = "text=\(messageInputted.text!)"
        //let urlEncoded = dados.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        // Config URL Request
        let url = URL(string: "https://ios-twitter.herokuapp.com/api/v2/message/\(editId)")
        var request = URLRequest(url: url!)
        request.httpMethod = "PUT"
        request.httpBody = dados.data(using: .utf8)
        
        // Start Session
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, erro) in
            
            if erro == nil {
                
                let result = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                print(result)
                
            }
            else {
                
                print("Erro: \(erro!.localizedDescription)")
                
            }
            
        }
        task.resume()
    }
    
    // EDIT and DELETE in TableView
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .normal, title: "Deletar") { (rowAction, indexPath) in
            
            let alertController = UIAlertController(title: "Warning!", message: nil, preferredStyle: UIAlertControllerStyle.alert)
            let del = UIAlertAction(title: "Delete", style: .destructive, handler: { action in
                
                self.deleleRowsTableView(inputId: self.fetchedMessages[indexPath.row].id)
                
                self.fetchedMessages.remove(at: indexPath.row)
                
                tableView.deleteRows(at: [indexPath], with: .automatic)
                
            })
            
            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
                
                tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
                
            })
            
            alertController.addAction(del)
            alertController.addAction(cancel)
            self.present(alertController, animated: true, completion: nil)
            
            
        }
        delete.backgroundColor = .red

        
        
        let edit = UITableViewRowAction(style: .normal, title: "Editar") { (rowAction, indexPath) in
            
            let alert = UIAlertController(title: "Twitter ADA", message: "Input your message and location", preferredStyle: UIAlertControllerStyle.alert)
            
            
            
            alert.addTextField(configurationHandler: self.messageInputtedTextField)
        
            let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
            
            let send = UIAlertAction(title: "Send", style: .default, handler: { (action) in
                self.editRowsTableView(editId: self.fetchedMessages[indexPath.row].id)
            })
            
            alert.addAction(cancel)
            alert.addAction(send)
            
            self.present(alert, animated: true, completion: nil)
            
        }
        edit.backgroundColor = .gray
        
        
        return [delete, edit]
    }


    
    
    
    

}
