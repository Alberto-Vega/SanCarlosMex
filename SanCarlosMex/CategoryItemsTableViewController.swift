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
    @IBOutlet var itemTableView: UITableView!
  
  var addCategoryItems: AddCategoriesClosure?
  var selectedCategory: Category?
  var testData: String?
  var pointsOfInterest: [PointOfInterest]?


    override func viewDidLoad() {
        super.viewDidLoad()
      print("The category passed is \(selectedCategory?.name)")
      if let selected = selectedCategory {
      print("Number of restaurants: \(selected.pointsOfInterest!.count)")
        print(testData)
        
        print("Test points of interest in DetailTableView: \(pointsOfInterest)")
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
      let pointOfInterestNameLabel = cell.viewWithTag(2) as! UILabel
       pointOfInterestNameLabel.text = selectedPointOfInterest?.name
        let pointOfInterestDescriptionLabel = cell.viewWithTag(1) as! UILabel
        pointOfInterestDescriptionLabel.text = selectedPointOfInterest?.description
        return cell
    }
  
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
      if segue.identifier == "POIDetailViewController" {
let POIDetailVC = segue.destinationViewController as? POIDetailViewController
        let indexPath = self.itemTableView.indexPathForSelectedRow
        if let selectedRow = indexPath?.row {
            let selectedPOI = self.pointsOfInterest?[selectedRow]
            POIDetailVC?.selectedPOI = selectedPOI
        }
      }
    }
}
