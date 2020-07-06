//
//  NewGoalViewController.swift
//  Goalie
//
//  Created by Jack Adams on 27/06/2020.
//  Copyright © 2020 Jack Adams. All rights reserved.
//

import UIKit
import Eureka

class NewGoalViewController: FormViewController {
    
    var goalViewModel: GoalViewModel!
    var goalType = GoalType.smoking
    
    private var baseForm: Form {
        get {
            let form = Form()
            form +++ Section("Goal Type")
                <<< PushRow<String>("type") { row in
                    row.value = goalType.rawValue
                    row.options = GoalType.allCases.map({$0.rawValue})
                    row.selectorTitle = "Select a Goal Type"
                }.onChange() { row in
                    if let v = row.value, let type = GoalType(rawValue: v) {
                        self.goalType = type
                        self.goalViewModel = self.goalViewModel(forType: type)
                        self.updateFormForNewType()
                    }
                    
            }
            return form
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Add Goal"
        
        self.form = baseForm
        
        if let row = form.rowBy(tag: "type") as? PushRow<String>, let value = row.value, let type = GoalType(rawValue: value) {
            
            self.goalViewModel = goalViewModel(forType: type)
            
        }
        
        updateFormForNewType()

        // Do any additional setup after loading the view.
    }
    
    
    func goalViewModel(forType type: GoalType) -> GoalViewModel {
        switch type {
        case .smoking: return SmokingGoalViewModel(goal: SmokingGoal(name: "", status: "", target: SmokingValue(value: 0)))
        case .time: return SmokingGoalViewModel(goal: SmokingGoal(name: "", status: "", target: SmokingValue(value: 0)))
        case .writing: return SmokingGoalViewModel(goal: SmokingGoal(name: "", status: "", target: SmokingValue(value: 0)))
        case .distance: return DistanceGoalViewModel(name: "", target: "")
        }
    }
    
    func updateFormForNewType() {
        
        var newForm = baseForm
        
        newForm = goalViewModel.addCreationSections(toForm: newForm)
        
        newForm +++ ButtonRow() { row in
            row.title = "Save"
        }
        
        self.form = newForm
        
        UIView.transition(with: tableView, duration: 1.0, options: .transitionCrossDissolve, animations: {self.tableView.reloadData()}, completion: nil)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
