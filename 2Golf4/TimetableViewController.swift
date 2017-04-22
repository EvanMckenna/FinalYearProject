//
//  TimetableViewController.swift
//  2Golf4
//
//  Created by Evan  on 19/04/2017.
//  Copyright © 2017 Evan . All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class TimetableViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var datePickerText: UITextField!
    @IBOutlet var tableView: UITableView!
    

    var timeList = [TimeModel]()
    
    
    let datePicker = UIDatePicker()
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "timesCell", for: indexPath) as! TimesCell
        
        let time: TimeModel
        
        time = timeList[indexPath.row]
        
        cell.nameLabel.text = time.author
        cell.timeLabel.text = time.time
        
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeList.count
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for parent in navigationController!.view.subviews {
            for child in parent.subviews {
                for view in child.subviews {
                    if view is UIImageView && view.frame.height == 0.5 {
                        view.alpha = 0
                    }
                }
            }
        }

                self.navigationItem.setHidesBackButton(true, animated: false)
        
        ref = FIRDatabase.database().reference()
        
        
     
    

        createDatePicker()
        
        ref = FIRDatabase.database().reference().child("times")
        
        ref?.observe(FIRDataEventType.value, with: { (snapshot) in
            if snapshot.childrenCount>0{
                
                self.timeList.removeAll()
                
                for times in snapshot.children.allObjects as![FIRDataSnapshot]{
                    let timeObject = times.value as? [String: AnyObject]
                    let timeAuthor = timeObject?["author"]
                    let timeTime = timeObject?["time"]
                    let timeUserID =  timeObject?["userID"]
                    
                    let time = TimeModel(author: timeAuthor as! String?, time: timeTime as! String?, userID: timeUserID as! String?)
                    
                    self.timeList.append(time)
                }
                
                self.tableView.reloadData()
            }
        })

    }
    
    
    
    
    
    
   

    func createDatePicker() {
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: false)
        
        
    
        datePickerText.inputAccessoryView = toolbar
        datePickerText.inputView = datePicker
        
    }
    @IBAction func uploadData(_ sender: Any) {
        
        if self.datePickerText.text == ""
        {
            
            let alertController = UIAlertController(title: "Oops!", message: "Please enter a time!", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true)
            
        }

        
        let uid = FIRAuth.auth()!.currentUser!.uid
        let ref = FIRDatabase.database().reference()
        
        let key = ref.child("times").childByAutoId().key
        
        let feed = ["userID" : uid,
                    "date" : [".sv": "timestamp"],
                    "author" : FIRAuth.auth()!.currentUser!.displayName!,
                    "time" : self.datePickerText.text!,
                    "timeID" : key] as [String : Any]
        
        let postFeed = ["\(key)" : feed]
        ref.child("times").updateChildValues(postFeed)

    }
    
    func donePressed() {

        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        
        datePickerText.text = dateFormatter.string(from: datePicker.date)
        
        self.view.endEditing(true)
    
    }
}


