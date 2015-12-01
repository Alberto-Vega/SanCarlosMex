//
//  CategoryItemsTableViewController.swift
//  SanCarlosMex
//
//  Created by Alberto Vega Gonzalez on 10/18/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

import UIKit

typealias AddCategoriesClosure = ()-> [Category]

class CategoryItemsTableViewController: UITableViewController {
  
  var addCategoryItems: AddCategoriesClosure?
  var selectedCategory: Category?
  var testData: String?
  var testPointsOfInterest: [PointOfInterest]?


    override func viewDidLoad() {
        super.viewDidLoad()
      print("The category passed is \(selectedCategory?.name)")
      if let selected = selectedCategory {
      print("Number of restaurants: \(selected.pointsOfInterest!.count)")
        print(testData)
        
        print("Test points of interest in DetailTableView: \(testPointsOfInterest)")
      }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
//        return ((selectedCategory?.pointsOfInterest.count)! + 10)
      return selectedCategory!.pointsOfInterest!.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CategoryItem", forIndexPath: indexPath)
      let index = indexPath.row
      let selectedPointOfInterest = self.selectedCategory?.pointsOfInterest![index]
      let pointOfInterestNameTextLabel = cell.viewWithTag(2) as! UILabel
       pointOfInterestNameTextLabel.text = selectedPointOfInterest?.name
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

  
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
      if segue.identifier == "ShowDetailViewController" {
//      segue.destinationViewController.
        // Pass the selected object to the new view controller.
      }
    }
}
