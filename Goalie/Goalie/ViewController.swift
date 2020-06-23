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
        self.present(self.authVC, animated: true, completion: nil)
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
                window.rootViewController = vc
                let options: UIView.AnimationOptions = .transitionCrossDissolve
                let duration: TimeInterval = 0.3
                
                UIView.transition(with: window, duration: duration, options: options, animations: {}, completion: nil)
            }
        case .failure(let e):
            print(e.localizedDescription)
            let alert = UIAlertController(title: "Error", message: "Oops, there was an error while signing you in. Please try again.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
         
