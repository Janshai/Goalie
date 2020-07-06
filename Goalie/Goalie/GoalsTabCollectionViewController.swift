//
//  GoalsTabCollectionViewController.swift
//  Goalie
//
//  Created by Jack Adams on 25/06/2020.
//  Copyright © 2020 Jack Adams. All rights reserved.
//

import UIKit


private let reuseIdentifier = "Cell"

class GoalsTabCollectionViewController: UICollectionViewController {
    
    var goals: [GoalViewModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let newGoal = SmokingGoalViewModel(goal: SmokingGoal(name: "Quit Smoking", status: "test", target: SmokingValue(value: 0, unit: Grams(), rate: PerDay())))
        
        goals.append(newGoal)

        layoutCells()
        self.collectionView!.dataSource = self
        self.collectionView!.delegate = self
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tapAddButton(_:)))

        // Do any additional setup after loading the view.
    }
    
    
    func layoutCells() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        layout.minimumInteritemSpacing = 5.0
        layout.minimumLineSpacing = 5.0
        layout.itemSize = CGSize(width: collectionView.bounds.size.width, height: ((UIScreen.main.bounds.size.height - 40)/6))
        collectionView!.collectionViewLayout = layout
    }
    
    @objc func tapAddButton(_ sender: UIBarButtonItem) {
        
        self.navigationController?.pushViewController(NewGoalViewController(), animated: true)
        
    }

    
    
    

}


// MARK: UICollectionViewDataSource
extension GoalsTabCollectionViewController {
    
    

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return goals.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? GoalsTableCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let goal = goals[indexPath.row]
        cell.goal = goal
        
        
    
        return cell
    }
}

// MARK: UICollectionViewDelegate

extension GoalsTabCollectionViewController {
    

    

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

