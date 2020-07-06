//
//  DistanceGoalViewModel.swift
//  Goalie
//
//  Created by Jack Adams on 27/06/2020.
//  Copyright © 2020 Jack Adams. All rights reserved.
//

import Foundation
import Eureka

public struct DistanceGoalViewModel: GoalViewModel {
    public func addToDataStore(onCompletion completion: @escaping (Error?) -> Void) {
        completion(nil)
    }
    
    public var ratesOfMeasurement: [RateOfMeasurement] = []
    
    public var unitsOfMeasurement: [UnitOfMeasurement] = []
    
    public var name: String
    
    public var target: String
    
    public func addCreationSections(toForm form: Form) -> Form {
        form +++ Section()
             <<< LabelRow() { row in
                 row.title = "distance stuff"
        }
        
        return form
    }
    
    
}
