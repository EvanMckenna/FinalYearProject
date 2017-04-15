//
//  FeedViewController.swift
//  2Golf4
//
//  Created by Evan  on 13/04/2017.
//  Copyright © 2017 Evan . All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class FeedViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet var collectionView: UICollectionView!
    
    
    @IBOutlet var Open: UIBarButtonItem!
    
    var posts = [Post]()
    var following = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        Open.target = self.revealViewController()
        Open.action = Selector("revealToggle:")
        

        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        
        fetchPosts()
        // Do any additional setup after loading the view.
    }

    
    func fetchPosts(){
        
        let ref = FIRDatabase.database().reference()
        
        ref.child("users").queryOrdered(byChild: "date").observeSingleEvent(of: .value, with: { snapshot in
            
            let users = snapshot.value as! [String : AnyObject]
            
            for (_,value) in users {
                if let uid = value["uid"] as? String {
                    if uid == FIRAuth.auth()?.currentUser?.uid {
                        if let followingUsers = value["following"] as? [String : String]{
                            for (_,user) in followingUsers{
                                self.following.append(user)
                            }
                        }
                        self.following.append(FIRAuth.auth()!.currentUser!.uid)
                        
                        ref.child("posts").queryOrderedByKey().observeSingleEvent(of: .value, with: { (snap) in
                            
                            let postsSnap = snap.value as! [String : AnyObject]

                            
                            for (_,post) in postsSnap {
                                if let userID = post["userID"] as? String {
                                    for each in self.following {
                                        if each == userID {
                                            let posst = Post()
                                            if let author = post["author"] as? String, let postID = post["postID"] as? String, let post = post["post"] as? String
                                            
                                            
                                            {
                                                
                                                posst.author = author
                                                posst.post = post
                                                posst.postID = postID
                                                posst.userID = userID
    
    
                                                
                                                self.posts.append(posst)
    
                                            }
                                        }
                                    }
                                    
                                    self.collectionView.reloadData()
                                    
                                }
                                

                                
                                
                            }
                        })
                    }
                }
            }
        })
        
        ref.removeAllObservers()
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "postCell", for: indexPath) as! PostCell
        
        cell.authorLabel.text = self.posts[indexPath.row].author
        cell.postView.text = self.posts[indexPath.row].post
        
        
        return cell
        
    }
    
    
    

}
