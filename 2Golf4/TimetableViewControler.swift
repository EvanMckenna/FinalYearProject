//
//  TimetableViewControler.swift
//  2Golf4
//
//  Created by Evan  on 19/04/2017.
//  Copyright © 2017 Evan . All rights reserved.
//

import UIKit

class TimetableViewControler: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
    var times = [Time]()
    var following = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
