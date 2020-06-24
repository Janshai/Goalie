//
//  ApplicationViewModel.swift
//  Goalie
//
//  Created by Jack Adams on 24/06/2020.
//  Copyright © 2020 Jack Adams. All rights reserved.
//

import UIKit

struct ApplicationViewModel {
    init() {
        
    }
    
    func setRootVC(toVC vc: UIViewController, forWindow window: UIWindow) {
        window.rootViewController = vc
        let options: UIView.AnimationOptions = .transitionCrossDissolve
        let duration: TimeInterval = 0.3
        
        UIView.transition(with: window, duration: duration, options: options, animations: {}, completion: nil)
    }
    
    func generateErrorAlert(error e: Error) -> UIAlertController {
        let alert = UIAlertController(title: "Error", message: e.localizedDescription, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default, handler: nil))
        return alert
    }
}
