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
    
    let applicationViewModel = ApplicationViewModel()

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
                let indicator = UIActivityIndicatorView()
                indicator.hidesWhenStopped = true
                indicator.style = .medium
                cell.backgroundView = indicator
                indicator.startAnimating()
                auth.logOut() { error in
                    indicator.stopAnimating()
                    if let e = error {
                        print(e.localizedDescription)
                        let alert = self.applicationViewModel.generateErrorAlert(error: e)
                        self.present(alert, animated: true, completion: nil)
                    } else {
                        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as? ViewController {
                            vc.launchPopUpOnAppear = false
                            guard let window = self.view.window else {
                                return
                            }
                            self.applicationViewModel.setRootVC(toVC: vc, forWindow: window)
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
