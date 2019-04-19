//
//  TaskCell.swift
//  Pomodoro Timer
//
//  Created by Daniel Hernández on 4/17/19.
//  Copyright © 2019 Daniel Hernández. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var objectiveLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var difficultyImageView: UIImageView!
    
    // MARK: - Properties
    var task: Task? {
        didSet {
            guard let task = task else { return }
            
            objectiveLabel.text = task.objective
            nameLabel.text = task.name
            difficultyImageView.image = image(forDifficulty: task.difficulty)
        }
    }
    
    func image(forDifficulty difficulty: Int) -> UIImage? {
        var imageName = "\(difficulty)Stars"
        if difficulty <= 0 {
            imageName = "1Stars"
        } else if difficulty > 5 {
            imageName = "5Stars"
        }
        return UIImage(named: imageName)
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
