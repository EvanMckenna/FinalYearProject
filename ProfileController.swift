//
//  ProfileController.swift
//  2Golf4
//
//  Created by Evan  on 02/03/2017.
//  Copyright © 2017 Evan . All rights reserved.
//

import UIKit
import Firebase


class ProfileController: UIViewController {
    
    @IBOutlet var Username: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let user = FIRAuth.auth()?.currentUser        {
            self.Username.alpha=1.0
            self.Username.text = user.email
        }
        else
        {
            self.Username.alpha = 1.0
            self.Username.text="Not Signed In"
        }
        
    }
    

    }
    



