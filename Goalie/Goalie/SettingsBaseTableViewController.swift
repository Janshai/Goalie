//
//  SettingsBaseTableViewController.swift
//  Goalie
//
//  Created by Jack Adams on 24/06/2020.
//  Copyright © 2020 Jack Adams. All rights reserved.
//

import UIKit
import Eureka

class SettingsBaseTableViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Settings"
        
        self.form +++ LabelRow() { row in
            row.title = "Profile"
        }
        
        self.form +++ ButtonRow() { row in
            row.title = "Log Out"
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
