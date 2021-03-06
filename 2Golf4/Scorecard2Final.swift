//
//  Scorecard1Final.swift
//  2Golf4
//
//  Created by Evan  on 15/04/2017.
//  Copyright © 2017 Evan . All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class Scorecard2Final: UIViewController {
    @IBOutlet var Username: UITextView!
    
    @IBOutlet var hole1: UILabel!
    @IBOutlet var hole2: UILabel!
    @IBOutlet var hole3: UILabel!
    @IBOutlet var hole4: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = FIRDatabase.database().reference()
        
        if let user = FIRAuth.auth()?.currentUser        {
            self.Username.alpha=1.0
            self.Username.text = user.displayName
            
        }
        else
        {
            self.Username.alpha = 1.0
            self.Username.text="Not Signed In"
        }
        
        if let userID = FIRAuth.auth()?.currentUser?.uid{
            ref?.child("users").child(userID).child("Scorecard2").observeSingleEvent(of: .value, with: { (snapshot) in
                let dictionary = snapshot.value as? NSDictionary
                
                let hole1 = dictionary?["Hole1"] as? String ?? "Hole 1"
                let hole2 = dictionary?["Hole2"] as? String ?? "Hole 2"
                let hole3 = dictionary?["Hole3"] as? String ?? "Hole 3"
                let hole4 = dictionary?["Hole4"] as? String ?? "Hole 4"
                
                self.hole1.text = hole1
                self.hole2.text = hole2
                self.hole3.text = hole3
                self.hole4.text = hole4
                
            })
        }
        
        
        // Do any additional setup after loading the view.
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
