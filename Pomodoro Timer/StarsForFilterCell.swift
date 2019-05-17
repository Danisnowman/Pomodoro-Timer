//
//  StarsForFIlterCell.swift
//  Pomodoro Timer
//
//  Created by Daniel Hernández on 5/16/19.
//  Copyright © 2019 Daniel Hernández. All rights reserved.
//

import UIKit

class StarsForFilterCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var starsForFilter: UIImageView!
    
    
    
    // MARK: - Properties
    var task: Task? {
        didSet {
            guard let task = task else { return }
            starsForFilter.image = image(forDifficulty: task.difficulty)
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

