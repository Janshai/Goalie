//
//  GoalsTableCollectionViewCell.swift
//  Goalie
//
//  Created by Jack Adams on 25/06/2020.
//  Copyright © 2020 Jack Adams. All rights reserved.
//

import UIKit

class GoalsTableCollectionViewCell: UICollectionViewCell {
    
    var goal: GoalViewModel! {
        didSet {
            name.text = goal.name
            target.text = goal.target
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var target: UILabel!
}
