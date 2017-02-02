//
//  FirstViewController.swift
//  2Golf4
//
//  Created by Evan  on 06/01/2017.
//  Copyright © 2017 Evan . All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    
    
    
    @IBOutlet var Open: UIBarButtonItem!
    
       override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
      Open.target = self.revealViewController()
      Open.action = Selector("revealToggle:")
        
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())

    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

