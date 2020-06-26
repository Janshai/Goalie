//
//  File.swift
//  Goalie
//
//  Created by Jack Adams on 24/06/2020.
//  Copyright © 2020 Jack Adams. All rights reserved.
//

import Foundation
import FirebaseAuth

extension Auth: AuthProvider {
    
    func logOut() throws {
        try self.signOut()
    }
    
    var signedInUser: String? {
        return self.currentUser?.uid
    }
    
    
}
