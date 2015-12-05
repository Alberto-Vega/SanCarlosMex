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
            print("Number of restaurants: \(selectedCategory?.pointsOfInterest![0].name)")
        setupTableViewBackGroundPhoto()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view
    
    
    func setupTableViewBackGroundPhoto() {
        
        itemTableView.backgroundView = UIImageView(image: UIImage(named: "playaAlgodones.jpg"))
        itemTableView.backgroundView!.contentMode = UIViewContentMode.ScaleAspectFill
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return selectedCategory!.pointsOfInterest!.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CategoryItem", forIndexPath: indexPath)
        let selectedPointOfInterest = self.selectedCategory?.pointsOfInterest![indexPath.row]
        
        
        if(indexPath.row % 2 == 0) {
            cell.backgroundColor = UIColor.clearColor()

        } else {
            cell.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2);
        }
        
        cell.detailTextLabel?.backgroundColor = UIColor.clearColor()
        cell.textLabel?.backgroundColor = UIColor.clearColor()
        
        let pointOfInterestNameLabel = cell.viewWithTag(2) as! UILabel
        pointOfInterestNameLabel.text = selectedPointOfInterest?.name
        let pointOfInterestDescriptionLabel = cell.viewWithTag(1) as! UILabel
        pointOfInterestDescriptionLabel.text = selectedPointOfInterest?.shortDescription
        
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
