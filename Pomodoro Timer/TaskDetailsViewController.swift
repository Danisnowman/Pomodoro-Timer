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
    
    var objective: String = "Chess" {
        didSet {
            detailLabel.text = objective
        }
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var detailLabel: UILabel!
    
    // MARK: - Initializers
    required init?(coder aDecoder: NSCoder) {
        print("init PlayerDetailsViewController")
        super.init(coder: aDecoder)
    }
    
    deinit {
        print("deinit PlayerDetailsViewController")
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SaveTaskDetail",
            let taskName = nameTextField.text {
            task = Task(name: taskName, objective: objective, difficulty: 1)
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
