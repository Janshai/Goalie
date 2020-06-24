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
            row.onCellSelection() { cell, row in
                let auth = AuthManager.defaultAuthProvider
                auth.logOut() { error in
                    if let e = error {
                        print(e.localizedDescription)
                        let alert = UIAlertController(title: "Error", message: "Oops, there was an error while signing you out. Please try again.", preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    } else {
                        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() {
                            guard let window = self.view.window else {
                                return
                            }
                            window.rootViewController = vc
                            let options: UIView.AnimationOptions = .transitionCrossDissolve
                            let duration: TimeInterval = 0.3
                            
                            UIView.transition(with: window, duration: duration, options: options, animations: {}, completion: nil)
                        }
                    }
                }
            }
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
