//
//  GoalViewModel.swift
//  Goalie
//
//  Created by Jack Adams on 27/06/2020.
//  Copyright © 2020 Jack Adams. All rights reserved.
//

import Foundation
import Eureka

public protocol GoalViewModel {
    
    var name: String {get set}
    
    var target: String {get set}
    
    func addCreationSections(toForm: Form) -> Form
    
    var ratesOfMeasurement: [RateOfMeasurement] { get }
    
    var unitsOfMeasurement: [UnitOfMeasurement] { get }
    
    func addToDataStore(onCompletion: @escaping (Error?) -> Void)
    
}
