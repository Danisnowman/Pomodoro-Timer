////
////  StarsPickerTableViewController.swift
////  Pomodoro Timer
////
////  Created by Daniel Hernández on 4/18/19.
////  Copyright © 2019 Daniel Hernández. All rights reserved.
////
//
//import UIKit
//
//class StarsPickerTableViewController: UITableViewController {
//
//    // MARK: - Properties
//    var stars = [
//        "1",
//        "2",
//        "3",
//        "4",
//        "5"
//    ]
//
//    var selectedStar: String? {
//        didSet {
//            if let selectedStar = selectedStar,
//                let index = stars.firstIndex(of: selectedStar) {
//                selectedStarIndex = index
//            }
//        }
//    }
//
//    var selectedStarIndex: Int?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Uncomment the following line to preserve selection between presentations
//        // self.clearsSelectionOnViewWillAppear = false
//
//        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//        // self.navigationItem.rightBarButtonItem = self.editButtonItem
//    }
//
//    // MARK: - Table view data source
//
////    override func numberOfSections(in tableView: UITableView) -> Int {
////        // #warning Incomplete implementation, return the number of sections
////        return 0
////    }
////
////    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        // #warning Incomplete implementation, return the number of rows
////        return 0
////    }
//
//    /*
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
//
//        // Configure the cell...
//
//        return cell
//    }
//    */
//
//    /*
//    // Override to support conditional editing of the table view.
//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the specified item to be editable.
//        return true
//    }
//    */
//
//    /*
//    // Override to support editing the table view.
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            // Delete the row from the data source
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }
//    }
//    */
//
//    /*
//    // Override to support rearranging the table view.
//    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
//
//    }
//    */
//
//    /*
//    // Override to support conditional rearranging of the table view.
//    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the item to be re-orderable.
//        return true
//    }
//    */
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
//
//// MARK: - UITableViewDataSource
//extension StarsPickerTableViewController {
//
//    override func tableView(_ tableView: UITableView,
//                            numberOfRowsInSection section: Int) -> Int {
//        return stars.count
//    }
//
//    override func tableView(_ tableView: UITableView,
//                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: "StarsCell", for: indexPath)
//        cell.textLabel?.text = stars[indexPath.row]
//
//        if indexPath.row == selectedStarIndex {
//            cell.accessoryType = .checkmark
//        } else {
//            cell.accessoryType = .none
//        }
//
//        return cell
//    }
//}
//
//// MARK: - UITableViewDelegate
//extension StarsPickerTableViewController {
//
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//
//        // Other row is selected - need to deselect it
//        if let index = selectedStarIndex {
//            let cell = tableView.cellForRow(at: IndexPath(row: index, section: 0))
//            cell?.accessoryType = .none
//        }
//
//        selectedStar = stars[indexPath.row]
//
//        // update the checkmark for the current row
//        let cell = tableView.cellForRow(at: indexPath)
//        cell?.accessoryType = .checkmark
//    }
//}
