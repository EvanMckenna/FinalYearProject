//
//  EditProfile.swift
//  2Golf4
//
//  Created by Evan  on 11/04/2017.
//  Copyright © 2017 Evan . All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth
import FirebaseStorage

class EditProfile: UIViewController {

    var ref: FIRDatabaseReference?

    @IBOutlet var FName: UITextField!
    @IBOutlet var LName: UITextField!
    @IBOutlet var Username: UITextField!
    
    
    @IBOutlet var profile_image: UIImageView!
    @IBOutlet var FNameButton: UIButton!
    @IBOutlet var LNameButton: UIButton!
    @IBOutlet var UNameButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storage = FIRStorage.storage().reference()
        
        
        ref = FIRDatabase.database().reference()

        self.navigationItem.hidesBackButton = true
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  
    
   
    @IBAction func EditNames(_ sender: Any) {
        
        let userName = self.Username.text!
        
        ref?.child("users").child(FIRAuth.auth()!.currentUser!.uid).child("Username").setValue(Username.text)
        
        let fName = self.FName.text!
        
        ref?.child("users").child(FIRAuth.auth()!.currentUser!.uid).child("FullName").setValue(FName.text)
        
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
