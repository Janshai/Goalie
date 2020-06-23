//
//  AuthViewModel.swift
//  Goalie
//
//  Created by Jack Adams on 23/06/2020.
//  Copyright © 2020 Jack Adams. All rights reserved.
//

import UIKit


protocol AuthViewModel {
    var authVC: UIViewController! { get }
    var delegate: AuthViewModelDelegate! { get set }
}

protocol AuthViewModelDelegate {
    func didSignInWith(result: Result<String, Error>)
}
