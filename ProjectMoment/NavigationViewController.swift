//
//  NavigationViewController.swift
//  ProjectMoment
//
//  Created by Hyunkyu Lee on 8/5/16.
//  Copyright © 2016 Hyunkyu Lee. All rights reserved.
//

import UIKit

class NavigationViewController: UINavigationController {
    
    struct ImageLiterals {
        static let NavigationItemSettings = "Navigation_Item_Settings.png"
        static let NavigationItemSettingsFilled = "Navigation_Item_Settings_Filled.png"
        static let NavigationItemCalendar = "Navigation_Item_Calendar.png"
        static let NavigationItemCalendarFilled = "Navigation_Item_Calendar_Filled.png"
        static let NavigationItemFilter = "Navigation_Item_Filter.png"
        static let NavigationItemFilterFilled = "Navigation_Item_Filter_Filled.png"
        static let NavigationItemMore = "Navigation_Item_More.png"
        static let NavigationItemMoreFilled = "Navigation_Item_More_Filled.png"
    }

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
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
