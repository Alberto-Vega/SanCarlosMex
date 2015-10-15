////
////  ViewController.swift
////  SanCarlosMex
////
////  Created by Alberto Vega Gonzalez on 6/12/15.
////  Copyright (c) 2015 Alberto Vega Gonzalez. All rights reserved.
////
//
//import UIKit
//
//class ViewController : UIViewController, UITableViewDataSource {
//  
//  @IBOutlet weak var tableView: UITableView!
//  
//  
//  override func viewDidLoad() {
//    super.viewDidLoad()
//    self.tableView.dataSource = self
//    
//
//   func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//    // #warning Incomplete implementation, return the number of sections
//    return 1
//  }
//
//  
//  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    return self.activities.count
//  }
//  
////  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
////    
////    let cell = self.tableView.dequeueReusableCellWithIdentifier("ActivityListItem", forIndexPath: indexPath)
////    let activityToDisplay = self.activities[indexPath.row]
////    cell.textLabel?.text = activityToDisplay.name
////    
////    return cell
////  }
////  
//  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//    if segue.identifier == "ShowDetailViewController" {
//      
//      let detailViewController = segue.destinationViewController as! DetailViewController
//      let indexPath = self.tableView.indexPathForSelectedRow
//      let selectedRow = indexPath!.row
//      let selectedActivity = self.activities[selectedRow]
//      print(selectedActivity.name)
//      detailViewController.selectedActivity = selectedActivity
//    }
//  }
//}
//
//
