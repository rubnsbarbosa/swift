//
//  Messages.swift
//  TwitterADA
//
//  Created by ifce on 11/09/17.
//  Copyright © 2017 ifce. All rights reserved.
//

import Foundation

class Messages {
    
    var id: String
    var text: String
    var latitude: Double
    var longitude: Double
    var city: String?

    init(id: String, text: String, latitude: Double, longitude: Double) {
        
        self.id = id
        self.text = text
        self.latitude = latitude
        self.longitude = longitude
        
    }
    
}
