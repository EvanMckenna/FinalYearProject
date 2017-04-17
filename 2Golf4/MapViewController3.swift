//
//  MapViewController3.swift
//  2Golf4
//
//  Created by Evan  on 22/03/2017.
//  Copyright © 2017 Evan . All rights reserved.
//

import UIKit
import MapKit
import FirebaseDatabase
import FirebaseAuth
import Firebase



class MapViewController3: UIViewController {

    var coreLocationManager =  CLLocationManager()
    var ref: FIRDatabaseReference?

    @IBOutlet var textView: UITextField!
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = FIRDatabase.database().reference()

             self.navigationItem.setHidesBackButton(true, animated: false)
        
        let distanceSpan:CLLocationDegrees = 500
        mapView.mapType = MKMapType.satellite
        
        let hole1:CLLocationCoordinate2D = CLLocationCoordinate2DMake(52.23644688819015, -7.0907145738601685)
        
        
        mapView.setRegion(MKCoordinateRegionMakeWithDistance(hole1, distanceSpan, distanceSpan), animated: true)
        
        let mapAnnotationClassPin = MapAnnotation(title: "Hole 3", subtitle: "Par 4 - 380 yds", coordinate: hole1)
        
        mapView.addAnnotation(mapAnnotationClassPin)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
  
        
        
    
    @IBAction func Accept(_ sender: Any) {
        
        
        ref?.child("users").child(FIRAuth.auth()!.currentUser!.uid).child("Scorecard1").child("Hole3").setValue(textView.text)
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
