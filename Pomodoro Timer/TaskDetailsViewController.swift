//
//  TaskDetailsViewController.swift
//  Pomodoro Timer
//
//  Created by Daniel Hernández on 4/17/19.
//  Copyright © 2019 Daniel Hernández. All rights reserved.
//

import UIKit

class TaskDetailsViewController: UITableViewController {
    
    // MARK: - Properties
    var task: Task?
    
    var objective: String = "Cálculo Multivariable" {
        didSet {
            detailLabel.text = objective
        }
    }
    
    var stars: String = "1" {
        didSet {
            
            starLabel.text = String(stars)
        }
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var starLabel: UILabel!
    @IBOutlet weak var starTextField: UITextField!
    
    // MARK: - Initializers
    required init?(coder aDecoder: NSCoder) {
        print("init PlayerDetailsViewController")
        super.init(coder: aDecoder)
    }
    
    deinit {
        print("deinit PlayerDetailsViewController")
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // Shadow unwrapping
        if segue.identifier == "SaveTaskDetail",
            let taskName = nameTextField.text, let difficultyStar = starTextField.text {
            task = Task(name: taskName, objective: objective, difficulty: Int(difficultyStar) ?? 1)
        }
        if segue.identifier == "PickObjective",
            let objectivePickerViewController = segue.destination as? ObjectivePickerViewController {
            objectivePickerViewController.selectedObjective = objective
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

// MARK: - UITableViewDelegate
extension TaskDetailsViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            nameTextField.becomeFirstResponder()
        }
    }
}

// MARK: - IBActions
extension TaskDetailsViewController {
    
    @IBAction func unwindWithSelectedObjective(segue: UIStoryboardSegue) {
        if let objectivePickerViewController = segue.source as? ObjectivePickerViewController,
            let selectedObjective = objectivePickerViewController.selectedObjective {
            objective = selectedObjective
        }
    }
}

//// MARK: - IBActions
//extension TaskDetailsViewController {
//
//    @IBAction func unwindWithSelectedStar(segue: UIStoryboardSegue) {
//        if let starsPickerViewController = segue.source as? StarsPickerTableViewController,
//            let selectedStar = starsPickerViewController.selectedStar {
//            stars = selectedStar
//        }
//    }
//}
