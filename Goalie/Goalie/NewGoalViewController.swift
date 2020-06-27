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
    
    private var baseForm: Form {
        get {
            let form = Form()
            form +++ Section("Goal Type")
                <<< PushRow<String>("type") { row in
                    row.value = GoalType.smoking.rawValue
                    row.options = GoalType.allCases.map({$0.rawValue})
                    row.selectorTitle = "Select a Goal Type"
            }
            return form
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Add Goal"
        
        updateFormForNewType()

        // Do any additional setup after loading the view.
    }
    
    
    func goalViewModel(forType type: GoalType) -> GoalViewModel {
        switch type {
        case .smoking: return SmokingGoalViewModel()
        case .time: return SmokingGoalViewModel()
        case .writing: return SmokingGoalViewModel()
        case .distance: return SmokingGoalViewModel()
        }
    }
    
    func updateFormForNewType() {
        
        let newForm = baseForm
        
        //vm
        
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
