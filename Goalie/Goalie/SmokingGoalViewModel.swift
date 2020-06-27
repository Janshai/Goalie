//
//  SmokingGoalViewModel.swift
//  Goalie
//
//  Created by Jack Adams on 27/06/2020.
//  Copyright © 2020 Jack Adams. All rights reserved.
//

import Foundation
import Eureka

struct SmokingGoalViewModel: GoalViewModel {
    var creationForm: Form {
        let form = Form()
        form +++ Section()
        return form
    }
    
    
}
