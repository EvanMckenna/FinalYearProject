//
//  TimesCell.swift
//  2Golf4
//
//  Created by Evan  on 19/04/2017.
//  Copyright © 2017 Evan . All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class TimesCell: UITableViewCell {
    
    
    var ref: FIRDatabaseReference!

    @IBOutlet var deleteButton: UIButton!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    
    var userID: String!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        ref = FIRDatabase.database().reference()

        
        if let user = FIRAuth.auth()?.currentUser        {
            self.deleteButton.alpha = 0.0
            
        }
        else
        {
            self.deleteButton.alpha = 0.0
        }
        
    }

    
    


}
