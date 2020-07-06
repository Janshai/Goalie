//
//  Goal.swift
//  Goalie
//
//  Created by Jack Adams on 25/06/2020.
//  Copyright © 2020 Jack Adams. All rights reserved.
//

import Foundation
public protocol Goal {
    associatedtype GoalValue
    var progress: Double { get }
    
    var name: String { get set }
    
    var status: String { get set }
    
    var target: GoalValue { get set }
    
    //progress updates
    
    // completed
    
    //category
}
