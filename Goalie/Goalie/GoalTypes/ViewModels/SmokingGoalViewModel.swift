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
    
    init(goal: SmokingGoal) {
        self.goal = goal
        self.name = goal.name
        self.target = goal.target.description
    }
    
    public func addCreationSections(toForm form: Form) -> Form {
        form +++ Section()
            <<< NameRow("name") { row in
                row.placeholder = "Name"
        }
        
        return form
    }
    
    public var name: String
    
    public var target: String
    
    
}
