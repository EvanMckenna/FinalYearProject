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


    @IBOutlet var Handicap: UILabel!
    @IBOutlet var Age: UILabel!
    @IBOutlet var profile_image: UIImageView!
    @IBOutlet var userName: UILabel!
    @IBOutlet var firstName: UILabel!
    @IBOutlet var Open: UIBarButtonItem!    
    @IBOutlet var Username: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = FIRDatabase.database().reference()

        Open.target = self.revealViewController()
        Open.action = Selector("revealToggle:")
        
        
        
        
            self.view.layoutIfNeeded()
             profile_image.layer.cornerRadius = profile_image.frame.size.width/2
             profile_image.clipsToBounds = true
            
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
            
            
            if let userID = FIRAuth.auth()?.currentUser?.uid{
                ref?.child("users").child(userID).observeSingleEvent(of: .value, with: { (snapshot) in
                    let dictionary = snapshot.value as? NSDictionary
                    
                    let Handicap = dictionary?["Handicap"] as? String ?? "None"
                    
                    self.Handicap.text = Handicap
                })
                
                if let userID = FIRAuth.auth()?.currentUser?.uid{
                    ref?.child("users").child(userID).observeSingleEvent(of: .value, with: { (snapshot) in
                        let dictionary = snapshot.value as? NSDictionary
                        
                        let Age = dictionary?["Age"] as? String ?? "None"
                        
                        self.Age.text = Age
                    })
                
            
        if let userID = FIRAuth.auth()?.currentUser?.uid{
        ref?.child("users").child(userID).observeSingleEvent(of: .value, with: { (snapshot) in
            
            let dictionary = snapshot.value as? [String: AnyObject]
            let profileImageURL = dictionary?["pics"] as? String ?? "Pic"

            let url = URL(string: profileImageURL)
            URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
                if error != nil{
                    print(error)
                    return
                }
                DispatchQueue.main.async{
                    self.profile_image?.image = UIImage(data: data!)
                }
            }).resume()
            })
}
}
}
}

}

}
    @IBAction func NextPage(_ sender: Any) {
    }
}
