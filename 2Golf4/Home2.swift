//
//  Home2.swift
//  2Golf4
//
//  Created by Evan  on 29/03/2017.
//  Copyright © 2017 Evan . All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import paper_onboarding


class Home2: UIViewController {

    @IBOutlet var Open: UIBarButtonItem!
    @IBOutlet var ScrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        for parent in navigationController!.view.subviews {
            for child in parent.subviews {
                for view in child.subviews {
                    if view is UIImageView && view.frame.height == 0.5 {
                        view.alpha = 0
                    }
                }
            }
        }
        
        
        Open.target = self.revealViewController()
        Open.action = #selector(SWRevealViewController.revealToggle(_:))
        
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())

       
        ScrollView.contentSize.height = 1500
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


}
