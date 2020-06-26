//
//  SmokingGoal.swift
//  Goalie
//
//  Created by Jack Adams on 25/06/2020.
//  Copyright © 2020 Jack Adams. All rights reserved.
//

import Foundation

class SmokingGoal: Goal {
    
    var progress: Double {
        get {
            return 0
        }
    }
    
    var name: String
    
    private var target: SmokingValue
    
    var status: String
    
    init(name: String, status: String, target: SmokingValue, start: SmokingValue) {
        self.name = name
        self.target = target
        self.status = status
        
    }
    
    
}

class SmokingValue: GoalValue {
    func calculateProgress(withValue: SmokingValue) -> Double {
        return 0
    }
    
    func isComplete(value: SmokingValue) -> Bool {
        return false
    }
    
    
}
