//
//  TasksTableViewController.swift
//  Pomodoro Timer
//
//  Created by Daniel Hernández on 4/17/19.
//  Copyright © 2019 Daniel Hernández. All rights reserved.
//

import UIKit

class TasksViewController: UITableViewController {
    
    // MARK: - Properties
    var tasks = SampleData.generateTaskDataSamples()
}

// MARK: - IBActions
extension TasksViewController {
    
    @IBAction func cancelToTasksViewController(_ segue: UIStoryboardSegue) {
    }
    
    @IBAction func saveTaskDetail(_ segue: UIStoryboardSegue) {
        
        guard let taskDetailsViewController = segue.source as? TaskDetailsViewController,
            let task = taskDetailsViewController.task else {
                return
        }
        
        // add the new player to the players array
        tasks.append(task)
        
        // update the tableView
        let indexPath = IndexPath(row: tasks.count - 1, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
}

// MARK: - UITableViewDataSource
extension TasksViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell",
                                                 for: indexPath) as! TaskCell
        
        let task = tasks[indexPath.row]
        cell.task = task
        return cell
    }
}
