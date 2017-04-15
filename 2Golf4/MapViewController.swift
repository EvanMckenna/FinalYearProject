//
//  MapViewController.swift
//  2Golf4
//
//  Created by Evan  on 15/03/2017.
//  Copyright © 2017 Evan . All rights reserved.
//

import UIKit
import MapKit
import FirebaseDatabase
import FirebaseAuth
import Firebase


class MapViewController: UIViewController{
    
    var ref: FIRDatabaseReference?
    
    @IBOutlet var mapView: MKMapView!
    var coreLocationManager = CLLocationManager()
    

    @IBOutlet var textView: UITextField!
    @IBOutlet var Hole1: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = FIRDatabase.database().reference()
        
        


        self.navigationItem.setHidesBackButton(true, animated: false)
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
    
    
 
        
        
        
        
        let distanceSpan:CLLocationDegrees = 300
        mapView.mapType = MKMapType.satellite
        
        let hole1:CLLocationCoordinate2D = CLLocationCoordinate2DMake(52.23741081, -7.09266756)
        
        
        mapView.setRegion(MKCoordinateRegionMakeWithDistance(hole1, distanceSpan, distanceSpan), animated: true)
        
        let mapAnnotationClassPin = MapAnnotation(title: "Hole 1", subtitle: "Par 4 - 400 yds", coordinate: hole1)
        
        mapView.addAnnotation(mapAnnotationClassPin)
    }


    @IBAction func Accept(_ sender: Any) {
        
        let score1 = self.textView.text!
        
        ref?.child("users").child(FIRAuth.auth()!.currentUser!.uid).child("Scorecard1").child("Hole1").setValue(textView.text)

    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
}
