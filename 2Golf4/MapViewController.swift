//
//  MapViewController.swift
//  2Golf4
//
//  Created by Evan  on 15/03/2017.
//  Copyright © 2017 Evan . All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController{
    
    var coreLocationManager = CLLocationManager()
    
    
    @IBOutlet var locationInfo: UILabel!
    @IBOutlet var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let distanceSpan:CLLocationDegrees = 500
        mapView.mapType = MKMapType.satellite
        
        let hole1:CLLocationCoordinate2D = CLLocationCoordinate2DMake(52.23741081, -7.09266756)
        
        
        mapView.setRegion(MKCoordinateRegionMakeWithDistance(hole1, distanceSpan, distanceSpan), animated: true)
        
        let mapAnnotationClassPin = MapAnnotation(title: "Hole 1", subtitle: "Par 4 - 400 yds", coordinate: hole1)
        
        mapView.addAnnotation(mapAnnotationClassPin)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
