//
//  EditProfile.swift
//  2Golf4
//
//  Created by Evan  on 11/04/2017.
//  Copyright © 2017 Evan . All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth
import FirebaseStorage

class EditProfile: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var ref: FIRDatabaseReference?

    @IBOutlet var FName: UITextField!
    @IBOutlet var LName: UITextField!
    @IBOutlet var Username: UITextField!
    @IBOutlet var Age: UITextField!
    @IBOutlet var Handicap: UITextField!
    
    
    @IBOutlet var profile_image: UIImageView!
    @IBOutlet var FNameButton: UIButton!
    @IBOutlet var LNameButton: UIButton!
    @IBOutlet var UNameButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.layoutIfNeeded()
        profile_image.layer.cornerRadius = profile_image.frame.size.width/2
        profile_image.clipsToBounds = true
        
        
        let storage = FIRStorage.storage()

        let storageRef = storage.reference()
        
        ref = FIRDatabase.database().reference()

        
        if let userID = FIRAuth.auth()?.currentUser?.uid{
            ref?.child("users").child(userID).observeSingleEvent(of: .value, with: { (snapshot) in
                let dictionary = snapshot.value as? NSDictionary
                
                let fullName = dictionary?["FullName"] as? String ?? "Full name"
                
                self.FName.text = fullName
                
                
            })
        }
        
        if let userID = FIRAuth.auth()?.currentUser?.uid{
            ref?.child("users").child(userID).observeSingleEvent(of: .value, with: { (snapshot) in
                let dictionary = snapshot.value as? NSDictionary
                
                let Username = dictionary?["Username"] as? String ?? "Username"
                
                self.Username.text = Username
                
                
            })
        }
        
        if let userID = FIRAuth.auth()?.currentUser?.uid{
            ref?.child("users").child(userID).observeSingleEvent(of: .value, with: { (snapshot) in
                let dictionary = snapshot.value as? NSDictionary
                
                let Age = dictionary?["Age"] as? String ?? "Age"
                
                self.Age.text = Age
                
            })
        }
        
        if let userID = FIRAuth.auth()?.currentUser?.uid{
            ref?.child("users").child(userID).observeSingleEvent(of: .value, with: { (snapshot) in
                let dictionary = snapshot.value as? NSDictionary
                
                let Handicap = dictionary?["Handicap"] as? String ?? "Handicap"
                
                self.Handicap.text = Handicap
                
                
            })
        }
        
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
        


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func uploadimageButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(picker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        var selectedImageFromPicker: UIImage?
        
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage{
            selectedImageFromPicker = editedImage
        } else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage{
            selectedImageFromPicker = originalImage
        }
        if let selectedImage = selectedImageFromPicker{
            profile_image.image = selectedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
   
    @IBAction func EditNames(_ sender: Any) {
        
        if self.FName.text == ""
        {
            
            let alertController = UIAlertController(title: "Oops!", message: "Please enter a name!", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true)
            
        }

        if self.Username.text == ""
        {
            
            let alertController = UIAlertController(title: "Oops!", message: "Please enter a username!", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true)
            
        }
        if self.Age.text == ""
        {
            
            let alertController = UIAlertController(title: "Oops!", message: "Please enter your age!", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true)
            
        }
        if self.Handicap.text == ""
        {
            
            let alertController = UIAlertController(title: "Oops!", message: "Please enter your handicap. If none, say none!", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true)
            
        }


        let userName = self.Username.text!
        
        ref?.child("users").child(FIRAuth.auth()!.currentUser!.uid).child("Username").setValue(Username.text)
        
        let changeRequest = FIRAuth.auth()!.currentUser!.profileChangeRequest()
        changeRequest.displayName = self.FName.text
        changeRequest.commitChanges(completion: nil)
        
        ref?.child("users").child(FIRAuth.auth()!.currentUser!.uid).child("FullName").setValue(FName.text)
        
        let age1 = self.Age.text!
        
        ref?.child("users").child(FIRAuth.auth()!.currentUser!.uid).child("Age").setValue(Age.text)
        
        let handicap = self.Handicap.text!
        
        ref?.child("users").child(FIRAuth.auth()!.currentUser!.uid).child("Handicap").setValue(Handicap.text)

        
        let imageName = NSUUID().uuidString
        
        let storageRef = FIRStorage.storage().reference()
        
       let storedImage = storageRef.child("profile_images").child(imageName)
        

        
        
        
        if let uploadData = UIImagePNGRepresentation(self.profile_image.image!)
        {
            storedImage.put(uploadData, metadata: nil, completion: { (metadata, error) in
                if error != nil{
                    print(error)
                    return
                }
                storedImage.downloadURL(completion: { (url, error) in
                    if error != nil{
                        print(error)
                        return
                    }
                    
                    if let urlText = url?.absoluteString{
                        self.ref?.child("users").child((FIRAuth.auth()?.currentUser?.uid)!).updateChildValues(["pics" : urlText], withCompletionBlock: { (error, ref) in
                            if error != nil{
                                print(error)
                                return
}
})
}
})
})
}



}
}
