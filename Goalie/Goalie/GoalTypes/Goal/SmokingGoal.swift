//
//  SmokingGoal.swift
//  Goalie
//
//  Created by Jack Adams on 25/06/2020.
//  Copyright © 2020 Jack Adams. All rights reserved.
//

import Foundation

public class SmokingGoal: Goal {
    
    
    public var deadline: Deadline = Deadline(date: Date(), op: .by)
    
    
    public var progress: Double {
        get {
            return 0
        }
    }
    
    public var name: String
    
    public var target: SmokingValue
    
    public var status: String
    
    private(set) var progressUpdates = [Date : SmokingValue]()
    
    init(name: String, status: String, target: SmokingValue, start: SmokingValue? = nil) {
        self.name = name
        self.target = target
        self.status = status
    }
    
    public func new(value: SmokingValue) {
        self.progressUpdates[Date()] = value
    }
    
    
}

public class SmokingValue: GoalValue {
    
    public var unit: UnitOfMeasurement?
    
    public var rate: RateOfMeasurement?
    
    public static var unitsOfMeasurement: [UnitOfMeasurement] = [Grams()]
    
    public static var ratesOfMeasurement: [RateOfMeasurement] = [PerDay()]
    
    private var internalValue: Double
    
    init(value: Double, unit: UnitOfMeasurement? = nil, rate: RateOfMeasurement? = nil) {
        self.internalValue = value
        self.unit = unit
        self.rate = rate
    }
    
    public func calculateProgress(withValue: SmokingValue) -> Double {
        return 0
    }
    
    public func isComplete(value: SmokingValue) -> Bool {
        return false
    }
    
    public var description: String {
        get {
            var ret: String = String(internalValue)
            ret += unit?.shortName ?? ""
            ret += " "
            ret += rate?.shortName ?? ""
            return ret
        }
    }
    
    
}
