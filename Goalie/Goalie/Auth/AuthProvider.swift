//
//  AuthProvider.swift
//  Goalie
//
//  Created by Jack Adams on 24/06/2020.
//  Copyright © 2020 Jack Adams. All rights reserved.
//

import Foundation

protocol AuthProvider {
    
    var signedInUser: String? { get }
    
    func logOut() throws
    
    func logOut(onCompletion: @escaping ((Error?) -> Void))
}

extension AuthProvider {
    func logOut(onCompletion completion: @escaping ((Error?) -> Void)) {
        var complete = false
        var e: Error? = nil
        do {
            try self.logOut()
        } catch {
            e = error
        }
        
        let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if self.signedInUser == nil {
                complete = true
                completion(e)
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            timer.invalidate()
            if !complete {
                completion(e)
            }
        }
    }
}

