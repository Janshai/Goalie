//
//  ViewController.swift
//  Goalie
//
//  Created by Jack Adams on 21/06/2020.
//  Copyright © 2020 Jack Adams. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var authVC: UIViewController!
    var launchPopUpOnAppear = true
    let applicationViewModel = ApplicationViewModel()
    
    @IBAction func tapSignIn(_ sender: UIButton) {
        setupAuthVC()
        self.present(self.authVC, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAuthVC()
        
    
    }
    
    func setupAuthVC() {
        var authViewModel = AuthManager.defaultAuthViewModel
        authViewModel.delegate = self
        self.authVC = authViewModel.authVC
    }

    override func viewDidAppear(_ animated: Bool) {
        if launchPopUpOnAppear {
            self.present(self.authVC, animated: true, completion: nil)
        }
        
    }


}

extension ViewController: AuthViewModelDelegate {
    func didSignInWith(result: Result<String, Error>) {
        switch result {
        case .success(_):
            if let vc = UIStoryboard(name: "Home", bundle: nil).instantiateInitialViewController() as? UITabBarController {
                guard let window = self.view.window else {
                    return
                }
                applicationViewModel.setRootVC(toVC: vc, forWindow: window)
            }
        case .failure(let e):
            print(e.localizedDescription)
            let alert = applicationViewModel.generateErrorAlert(error: e)
            self.present(alert, animated: true, completion: nil)
        }
    }
}
         
