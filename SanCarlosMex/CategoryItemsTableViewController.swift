//
//  CategoryItemsTableViewController.swift
//  SanCarlosMex
//
//  Created by Alberto Vega Gonzalez on 10/18/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

import UIKit

class CategoryItemsTableViewController: UITableViewController {
    @IBOutlet var itemTableView: UITableView!
    
    var selectedCategory: Category?
    var testData: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("The category passed is \(selectedCategory?.name)")
        if let selected = selectedCategory {
            print("Number of restaurants: \(selectedCategory?.pointsOfInterest?.count)")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return selectedCategory!.pointsOfInterest!.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CategoryItem", forIndexPath: indexPath)
        let selectedPointOfInterest = self.selectedCategory?.pointsOfInterest![indexPath.row]
        
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
                let selectedPOI = self.selectedCategory?.pointsOfInterest![selectedRow]
                POIDetailVC?.selectedPOI = selectedPOI
            }
        }
    }
}
