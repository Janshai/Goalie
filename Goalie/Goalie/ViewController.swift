//
//  ViewController.swift
//  Goalie
//
//  Created by Jack Adams on 21/06/2020.
//  Copyright © 2020 Jack Adams. All rights reserved.
//

import UIKit
import FirebaseUI

class ViewController: UIViewController {
    
    var authVC: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let authUI = FUIAuth.defaultAuthUI()
        authUI?.delegate = self
        let providers: [FUIAuthProvider] = [
          FUIEmailAuth()
        ]
        
        authUI?.providers = providers
        
        let vc = authUI?.authViewController()
        if let vc = vc {
            self.authVC = vc
        }
        
    
    }

    override func viewDidAppear(_ animated: Bool) {
        self.present(self.authVC, animated: true, completion: nil)
    }


}

extension ViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        if let e = error {
            
            print(e.localizedDescription)
            
        } else {
            if let vc = UIStoryboard(name: "Home", bundle: nil).instantiateInitialViewController() as? UITabBarController {
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

