//
//  3DHole1.swift
//  2Golf4
//
//  Created by Evan  on 21/04/2017.
//  Copyright © 2017 Evan . All rights reserved.
//

import UIKit

class _DHole1: UIViewController, UIScrollViewDelegate {

    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 6.0
        
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
   
    
    @IBAction func closePopUp(_ sender: Any) {
   
        dismiss(animated: true, completion: nil)
    
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
}
