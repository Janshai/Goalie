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
                <<< PushRow<GoalType>("type") { row in
                    row.value = goalType
                    row.options = GoalType.allCases
                    row.displayValueFor = { value in
                        switch value {
                        case .some(let type): return type.rawValue.capitalized
                        default: return "Error"
                        }
                    }
                    row.selectorTitle = "Select a Goal Type"
                }.onChange() { row in
                    if let v = row.value {
                        self.goalType = v
                        self.goalViewModel = self.goalViewModel(forType: v)
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
        
        if let row = form.rowBy(tag: "type") as? PushRow<GoalType> {
            if let value = row.value {
                self.goalViewModel = goalViewModel(forType: value)
            }
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
            row.onCellSelection { cell, row in
                //validate
                self.updateViewModel()
                let indicator = UIActivityIndicatorView()
                indicator.hidesWhenStopped = true
                indicator.style = .medium
                cell.backgroundView = indicator
                indicator.startAnimating()
                self.tableView.isUserInteractionEnabled = false
                self.goalViewModel.addToDataStore { [weak self] error in
                    indicator.stopAnimating()
                    self?.tableView.isUserInteractionEnabled = true
                    guard let _ = error else {
                        self?.navigationController?.popViewController(animated: true)
                        return
                    }
                    //error
                    return
                }
                
            }
        }
        
        self.form = newForm
        
        UIView.transition(with: tableView, duration: 1.0, options: .transitionCrossDissolve, animations: {self.tableView.reloadData()}, completion: nil)
        
    }
    
    func updateViewModel() {
        
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
