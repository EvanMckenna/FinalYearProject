//
//  user.swift
//  2Golf4
//
//  Created by Evan  on 09/04/2017.
//  Copyright © 2017 Evan . All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

struct user {
    var hole1: String!
    var ref: FIRDatabaseReference?
    var key: String?
    
    init(snapshot: FIRDataSnapshot){
        
        key = snapshot.key
        ref = snapshot.ref
        hole1 = (snapshot.value! as! NSDictionary)["Hole1"] as! String
    }
    func toAnyObject() -> [String:AnyObject] {
        return["Hole1"]
    }
}
