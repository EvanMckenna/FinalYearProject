//
//  OnboardViewController.swift
//  2Golf4
//
//  Created by Evan  on 22/04/2017.
//  Copyright © 2017 Evan . All rights reserved.
//

import UIKit
import PaperOnboarding


class OnboardViewController: UIViewController,PaperOnboardingDataSource, PaperOnboardingDelegate {

    @IBOutlet weak var onboardingView: OnboardingView!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        onboardingView.dataSource = self
        onboardingView.delegate = self
        
        // Do any additional setup after loading the view.
    }

    
    func onboardingItemsCount() -> Int {
        return 5
    }
    
    //Setting values to enter to the onboarding screen
    
    func onboardingItemAtIndex(_ index: Int) -> OnboardingItemInfo {
        let backgroundColorOne = UIColor(red: 56/255, green: 229/255, blue: 138/255, alpha: 1)
         let backgroundColorTwo = UIColor(red: 84/255, green: 128/255, blue: 155/255, alpha: 1)
         let backgroundColorThree = UIColor(red: 49/255, green: 78/255, blue: 96/255, alpha: 1)
         let backgroundColorFour = UIColor(red: 236/255, green: 197/255, blue: 66/255, alpha: 1)
          let backgroundColorFive = UIColor(red: 230/255, green: 123/255, blue: 55/255, alpha: 1)

        let titleFont = UIFont(name: "Roboto-Regular", size: 24)!
        let descirptionFont = UIFont(name: "Roboto-Light", size: 18)!

        return [("Scorecard", "Scorecard", "To use the scorecard, all you have to do is navigate to it from the homepage or the sidebar, select your scorecard and start your round! Click the golf ball icon on the top right to view your score.", "", backgroundColorOne, UIColor.white, UIColor.white, titleFont, descirptionFont),
        
          ("Courses", "Courses", "If you are not playing a round of golf, do some research and use the course viewer to look at the map view and 3D view of the different holes.", "", backgroundColorTwo, UIColor.white, UIColor.white, titleFont, descirptionFont),
        
          ("Profile", "Profile", "Upload profile images, view past scorecards and even add scorecards straight from the profile section", "", backgroundColorThree, UIColor.white, UIColor.white, titleFont, descirptionFont),
        
         ("News", "News", "Away from the clubhouse? Check out the news section where other members post new information about tournaments and other events!", "", backgroundColorFour, UIColor.white, UIColor.white, titleFont, descirptionFont),
        
        
        ("Timetable", "Timetable", "Want to let other users know when you are gonna play a round of golf? Just enter a time into the timetable for other users to see.", "", backgroundColorFive, UIColor.white, UIColor.white, titleFont, descirptionFont)][index]
 
    }
    
    //Conforming to onboarding delegate

        func onboardingConfigurationItem(_ item: OnboardingContentViewItem, index: Int) {
            
        }
        
        
        
        func onboardingWillTransitonToIndex(_ index: Int) {
            if index == 4 {
                
                if self.startButton.alpha == 1 {
                    UIView.animate(withDuration: 0.2, animations: {
                        self.startButton.alpha = 0
                    })
                }
                
            }
        }
        
        func onboardingDidTransitonToIndex(_ index: Int) {
            if index == 4 {
                UIView.animate(withDuration: 0.4, animations: {
                    self.startButton.alpha = 1
                })
            }
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
