//
//  GoalValue.swift
//  Goalie
//
//  Created by Jack Adams on 25/06/2020.
//  Copyright © 2020 Jack Adams. All rights reserved.
//

import Foundation

protocol GoalValue {
    func calculateProgress(withValue: Self) -> Double
    
    func isComplete(value: Self) -> Bool
}
