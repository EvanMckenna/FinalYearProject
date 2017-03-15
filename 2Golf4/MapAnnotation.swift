//
//  MapAnnotation.swift
//  2Golf4
//
//  Created by Evan  on 15/03/2017.
//  Copyright © 2017 Evan . All rights reserved.
//

import MapKit

class MapAnnotation: NSObject, MKAnnotation {
    
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title:String, subtitle:String, coordinate:CLLocationCoordinate2D){
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
}
