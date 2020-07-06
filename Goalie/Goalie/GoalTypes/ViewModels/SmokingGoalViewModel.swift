//
//  SmokingGoalViewModel.swift
//  Goalie
//
//  Created by Jack Adams on 27/06/2020.
//  Copyright © 2020 Jack Adams. All rights reserved.
//

import Foundation
import Eureka

public struct SmokingGoalViewModel: GoalViewModel {
    private var goal : SmokingGoal
    
    public var ratesOfMeasurement: [RateOfMeasurement] = SmokingValue.ratesOfMeasurement
    public var unitsOfMeasurement: [UnitOfMeasurement] = SmokingValue.unitsOfMeasurement
    
    init(goal: SmokingGoal) {
        self.goal = goal
        self.name = goal.name
        self.target = goal.target.description
    }
    
    public func addToDataStore(onCompletion completion: @escaping (Error?) -> Void) {
        completion(nil)
    }
    
    public func addCreationSections(toForm form: Form) -> Form {
        form +++ Section("Goal")
            <<< NameRow("name") { row in
                row.placeholder = "Name"
                
            }
            <<< PushRow<String>("unit") { row in
                let units = unitsOfMeasurement.map({$0.longName.capitalized})
                row.options = ["No Unit"] + units
                row.value = "No Unit"
                row.selectorTitle = "Select Target Unit"
            }
            <<< DecimalRow("target", { (row) in
                row.placeholder = "Target"
            })
            <<< PushRow<String>("rate") { row in
                let rates = ratesOfMeasurement.map({$0.longName.capitalized})
                row.options = ["No Rate"] + rates
                row.value = "No Rate"
                row.selectorTitle = "Select Target Rate"
            }
            +++ Section("Deadline")
            <<< ActionSheetRow<DeadlineOperator>("op") { row in
                row.options = DeadlineOperator.allCases
                row.value = .none
                row.displayValueFor = {
                    switch $0 {
                    case .some(let op): return op.rawValue.capitalized
                    default: return "Error"
                    }
                }
            }
            <<< DateInlineRow("deadline") { row in
                row.value = Date()
        }
            
        
        return form
    }
    
    public var name: String
    
    public var target: String
    
    
}
