//
//  ProfileController.swift
//  2Golf4
//
//  Created by Evan  on 02/03/2017.
//  Copyright © 2017 Evan . All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseStorage

var ref: FIRDatabaseReference?

class ProfileController: UIViewController {


    @IBOutlet var userName: UILabel!
    @IBOutlet var firstName: UILabel!
    @IBOutlet var Open: UIBarButtonItem!    
    @IBOutlet var ImagePicker: UIImageView!
    @IBOutlet var Username: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = FIRDatabase.database().reference()

        Open.target = self.revealViewController()
        Open.action = Selector("revealToggle:")
        
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
       
                
            
        if let userID = FIRAuth.auth()?.currentUser?.uid{
            ref?.child("users").child(userID).observeSingleEvent(of: .value, with: { (snapshot) in
                let dictionary = snapshot.value as? NSDictionary
                
                let fullName = dictionary?["FullName"] as? String ?? "Full name"
                
                self.firstName.text = fullName
            })
            
            
        
        if let userID = FIRAuth.auth()?.currentUser?.uid{
            ref?.child("users").child(userID).observeSingleEvent(of: .value, with: { (snapshot) in
                let dictionary = snapshot.value as? NSDictionary
                
                let userName = dictionary?["Username"] as? String ?? "Username"
                
                self.userName.text = userName 
                })
}
}
}
}




