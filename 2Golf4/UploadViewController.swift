//
//  UploadViewController.swift
//  2Golf4
//
//  Created by Evan  on 13/04/2017.
//  Copyright © 2017 Evan . All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class UploadViewController: UIViewController {
    
    
    
    @IBOutlet var previewText: UITextView!
    @IBOutlet var selectBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func postPressed(_ sender: Any) {
        AppDelegate.instance().showActivityIndicator()
        
        let uid = FIRAuth.auth()!.currentUser!.uid
        let ref = FIRDatabase.database().reference()
        
        let key = ref.child("posts").childByAutoId().key
        
        let feed = ["userID" : uid,
                    "date" : [".sv": "timestamp"],
                    "author" : FIRAuth.auth()!.currentUser!.displayName!,
                    "post" : self.previewText.text!,
        "postID" : key] as [String : Any]
        
        let postFeed = ["\(key)" : feed]
        ref.child("posts").updateChildValues(postFeed)
        
        
        AppDelegate.instance().dismissActivityIndicator()
        self.dismiss(animated: true, completion: nil)
        
    }

}
