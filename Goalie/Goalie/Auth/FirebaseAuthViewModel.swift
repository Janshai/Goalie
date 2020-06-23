//
//  FirebaseAuthViewModel.swift
//  Goalie
//
//  Created by Jack Adams on 23/06/2020.
//  Copyright © 2020 Jack Adams. All rights reserved.
//


import FirebaseUI
import UIKit

class FirebaseAuthViewModel: NSObject, AuthViewModel {
    var authVC: UIViewController!
    
    var delegate: AuthViewModelDelegate!
    
    let providers: [FUIAuthProvider] = [
      FUIEmailAuth()
    ]
    
    override init() {
        super.init()
        setupAuthVC()
    }
    
    func setupAuthVC() {
        let authUI = FUIAuth.defaultAuthUI()
        authUI?.delegate = self
        
        
        authUI?.providers = self.providers
        
        let vc = authUI?.authViewController()
        if let vc = vc {
            self.authVC = vc
        }
    }
    
    
}

extension FirebaseAuthViewModel: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        var result: Result<String, Error>
        
        if let e = error {
            print(e.localizedDescription)
            result = .failure(e)
        } else {
            result = .success("Successful Login")
        }
        
        delegate.didSignInWith(result: result)
    }
}
