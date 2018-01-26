//
//  MapPin.swift
//  TwitterADA
//
//  Created by ifce on 15/09/17.
//  Copyright © 2017 ifce. All rights reserved.
//

import MapKit

class MapPin: NSObject , MKAnnotation {

    var text: String?
    var coordinate: CLLocationCoordinate2D
    
    init(text: String, coordinate: CLLocationCoordinate2D) {
    
        self.text = text
        self.coordinate = coordinate
        
    }


}
