//
//  Users.swift
//  2Golf4
//
//  Created by Evan  on 13/04/2017.
//  Copyright © 2017 Evan . All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

class Users1ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    var user = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
}
   
    func retrieveUsers() {
        let ref = FIRDatabase.database().reference()
        
        ref.child("users").queryOrderedByKey().observeSingleEvent(of: .value, with: { (snapshot) in
            let users = snapshot.value as! [String: AnyObject]
            self.user.removeAll()
            for (_, value) in users {
                if let uid = value["uid"] as? String{
                    if uid != FIRAuth.auth()!.currentUser!.uid {
                        let userToShow = User()
            
                        if let fullName = value["FullName"] as? String, let imagePath = value["pics"] as? String {
                           userToShow.fullName = fullName
                            userToShow.imagePath = imagePath
                            userToShow.userID = uid
                            self.user.append(userToShow)
                            
                            
                        }
                    }
            }
            
        
        
    }
        
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserCell
        
            cell.nameLabel
            cell.userID = self.user[indexPath.row].userID
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.count ?? 0
    }
})
}
}
