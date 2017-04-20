//
//  MapViewController4.swift
//  2Golf4
//
//  Created by Evan  on 22/03/2017.
//  Copyright © 2017 Evan . All rights reserved.
//

import UIKit
import MapKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class MapViewController24: UIViewController {
    
    var ref: FIRDatabaseReference?
    var coreLocationManager =  CLLocationManager()
    
    @IBOutlet var mapView: MKMapView!
    
    @IBOutlet var textView: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = FIRDatabase.database().reference()
        
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        let distanceSpan:CLLocationDegrees = 300
        mapView.mapType = MKMapType.satellite
        
        let hole1:CLLocationCoordinate2D = CLLocationCoordinate2DMake(52.235875260987065, -7.090894281864166)
        
        
        mapView.setRegion(MKCoordinateRegionMakeWithDistance(hole1, distanceSpan, distanceSpan), animated: true)
        
        let mapAnnotationClassPin = MapAnnotation(title: "Hole 4", subtitle: "Par 3 - 160 yds", coordinate: hole1)
        
        mapView.addAnnotation(mapAnnotationClassPin)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Accept(_ sender: Any) {
        
        let score1 = self.textView.text!
        
        ref?.child("users").child(FIRAuth.auth()!.currentUser!.uid).child("Scorecard2").child("Hole4").setValue(textView.text)
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
