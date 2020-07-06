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
    
    var deadline: Deadline { get }
    
    //progress updates
    func new(value: GoalValue)
    
    

    // completed
    
    //category
    
    
}

public struct Deadline {
    var date: Date
    var op: DeadlineOperator

}

public enum DeadlineOperator {
    case by
    case until
}
