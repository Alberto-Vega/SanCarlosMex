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
        itemTableView.backgroundView!.contentMode = UIViewContentMode.scaleAspectFill
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return selectedCategory!.pointsOfInterest!.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryItem", for: indexPath)
        let selectedPointOfInterest = self.selectedCategory?.pointsOfInterest![(indexPath as NSIndexPath).row]
        
        
        if((indexPath as NSIndexPath).row % 2 == 0) {
            cell.backgroundColor = UIColor.clear

        } else {
            cell.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2);
        }
        
        cell.detailTextLabel?.backgroundColor = UIColor.clear
        cell.textLabel?.backgroundColor = UIColor.clear
        
        let pointOfInterestNameLabel = cell.viewWithTag(2) as! UILabel
        pointOfInterestNameLabel.text = selectedPointOfInterest?.name
        let pointOfInterestDescriptionLabel = cell.viewWithTag(1) as! UILabel
        pointOfInterestDescriptionLabel.text = selectedPointOfInterest?.shortDescription
        
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "POIDetailViewController" {
            let POIDetailVC = segue.destination as? POIDetailViewController
            let indexPath = self.itemTableView.indexPathForSelectedRow
            if let selectedRow = (indexPath as NSIndexPath?)?.row {
                let selectedPOI = self.selectedCategory?.pointsOfInterest![selectedRow]
                POIDetailVC?.selectedPOI = selectedPOI
            }
        }
    }
}
