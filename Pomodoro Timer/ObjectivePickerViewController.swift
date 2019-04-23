//
//  ObjectivePickerViewController.swift
//  Pomodoro Timer
//
//  Created by Daniel Hernández on 4/17/19.
//  Copyright © 2019 Daniel Hernández. All rights reserved.
//

import UIKit

class ObjectivePickerViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Properties
    var objectives = [
        "Estructuras de Datos",
        "Cálculo Multivariable",
        "Statistical Thinking I",
        "Cost Analysis",
        "Global Managment",
        "Introducción a DevOps"
    ]
    
    var selectedObjective: String? {
        didSet { // Shadow Unwrapping (if let a = a)
            if let selectedObjective = selectedObjective,
                let index = objectives.firstIndex(of: selectedObjective) {
                selectedObjectiveIndex = index
            }
        }
    }
    
    var selectedObjectiveIndex: Int?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == "SaveSelectedObjective",
            let cell = sender as? UITableViewCell,
            let indexPath = tableView.indexPath(for: cell) else {
                return
        }
        
        let index = indexPath.row
        selectedObjective = objectives[index]
    }

}

// MARK: - UITableViewDataSource
extension ObjectivePickerViewController {
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return objectives.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ObjectiveCell", for: indexPath)
        cell.textLabel?.text = objectives[indexPath.row]
        
        if indexPath.row == selectedObjectiveIndex {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ObjectivePickerViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Other row is selected - need to deselect it
        if let index = selectedObjectiveIndex {
            let cell = tableView.cellForRow(at: IndexPath(row: index, section: 0))
            cell?.accessoryType = .none
        }
        
        selectedObjective = objectives[indexPath.row]
        
        // update the checkmark for the current row
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark
    }
}
