//
//  GoalValue.swift
//  Goalie
//
//  Created by Jack Adams on 25/06/2020.
//  Copyright © 2020 Jack Adams. All rights reserved.
//

import Foundation

public protocol GoalValue {
    func calculateProgress(withValue: Self) -> Double
    
    func isComplete(value: Self) -> Bool
    
    var description : String { get }
    
    //unit
    var unit: UnitOfMeasurement? { get set }
    
    //rate
    var rate: RateOfMeasurement? { get set }
}

public protocol UnitOfMeasurement {
    
    var shortName: String { get }
    
    var longName: String { get }
    
}

public protocol RateOfMeasurement {
    var shortName: String { get }
    
    var longName: String { get }
}


