//
//  Scorecard1.swift
//  2Golf4
//
//  Created by Evan  on 06/04/2017.
//  Copyright © 2017 Evan . All rights reserved.
//

import UIKit
import FirebaseAuth

class Scorecard1: UIViewController {

    @IBOutlet var BackButton: UIButton!
    @IBOutlet var PopupView: UIView!
    @IBOutlet var Username: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PopupView.layer.cornerRadius = 10
        PopupView.layer.masksToBounds = true
        
        if let user = FIRAuth.auth()?.currentUser        {
            self.Username.alpha=1.0
            self.Username.text = user.email
        }
        else
        {
            self.Username.alpha = 1.0
            self.Username.text="Not Signed In"
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

    @IBAction func ClosePopUp(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
