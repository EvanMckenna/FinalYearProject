//
//  SecondViewController.swift
//  2Golf4
//
//  Created by Evan  on 06/01/2017.
//  Copyright © 2017 Evan . All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseDatabase



class SecondViewController: UIViewController {
 
    var ref: FIRDatabaseReference!
    
    @IBOutlet var popUpView: UIView!
    @IBOutlet var usernameLabe: UILabel!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var logoutButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = FIRDatabase.database().reference()
        
        //Creating round edges
        
        popUpView.layer.cornerRadius = 10
        popUpView.layer.masksToBounds = true
        
        //Check if logged in 
        
        if let user = FIRAuth.auth()?.currentUser        {
            self.logoutButton.alpha=1.0
        
        }
        else
        {
            self.logoutButton.alpha = 0.0
            self.usernameLabe.text=""
        }
        
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    @IBAction func ClosePopUp(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func createAccountAction(_ sender: Any)
    {
        //If black do the following:
        if self.emailField.text == "" || self.passwordField.text == ""
        {
            
            let alertController = UIAlertController(title: "Oops!", message: "Please enter email and password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true)
            
        }
            
        else
        {   // if details are correct, populate the database
            
            FIRAuth.auth()?.createUser(withEmail: self.emailField.text!, password: self.passwordField.text!, completion: { (user, error) in
                if error == nil
                {
                    self.ref.child("users").updateChildValues(["\(FIRAuth.auth()!.currentUser!.uid)" :["Email":self.emailField.text!]])
                    self.ref.child("users").updateChildValues(["\(FIRAuth.auth()!.currentUser!.uid)" :["uid": user?.uid]])
                    self.logoutButton.alpha = 1.0
                    self.usernameLabe.text = user!.email
                    self.emailField.text = ""
                    self.passwordField.text = ""

                    
                }
                else
                {
                    
                    let alertController = UIAlertController(title: "Oops!", message: error?.localizedDescription , preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true)
                    
                    
                }
            })
            
        }
        
    }

    @IBAction func LogInAction(_ sender: Any) {
        
        if self.emailField.text == "" || self.passwordField.text == ""
        {
            
            let alertController = UIAlertController(title: "Oops!", message: "Please enter email and password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        }
        else
        {
            FIRAuth.auth()?.signIn(withEmail: self.emailField.text!, password: self.passwordField.text!, completion: { (user, error) in
                if error == nil
                {
                    self.logoutButton.alpha = 1.0
                    self.usernameLabe.text = user!.email
                    self.emailField.text = ""
                    self.passwordField.text = ""
                    

                    
                }
                else
                {
                    
                    let alertController = UIAlertController(title: "Oops!", message: error?.localizedDescription , preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true)
                    
                }
                
            })
        }
        
        
        
    }
    
    
    @IBAction func LogoutAction(_ sender: Any)
    {
            try! FIRAuth.auth()?.signOut()
            
            self.usernameLabe.text = ""
            self.logoutButton.alpha = 0.0
            self.emailField.text = ""
            self.passwordField.text = ""
        }
    

}









