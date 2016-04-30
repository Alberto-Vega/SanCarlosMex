//
//  CategoryItemsTableViewController.swift
//  SanCarlosMex
//
//  Created by Alberto Vega Gonzalez on 10/18/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

import UIKit

class CategoryItemsTableViewController: UITableViewController, SegueHandlerType {
    
    enum SegueIdentifier: String {
        case POIDetailViewController
    }
    @IBOutlet var itemTableView: UITableView!
    
    var selectedCategory: Category?
    var venuesFromFourSquare:[AnyObject]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createRestaurants()
        print("The category passed is \(selectedCategory?.name)")
        guard let  searchCategory = selectedCategory?.name else {
            print("No valid category to search")
            return
        }
//        FourSquareService.searchVenues("Restaurants") { (success, data) in
//            guard let data = data else {
//                print("No data was returned")
//                return
//            }
//            FourSquareService.parseVenueResponse(data, completion: { (success, venues) in
//                if success {
//                    guard let venues = venues else {
//                        print("No venues were parsed successfully")
//                        return
//                    }
//                    self.venuesFromFourSquare = venues
//                }
//            })
//        }
        
        
//        if let selected = selectedCategory {
//            print("Number of restaurants: \(selectedCategory!.pointsOfInterest?[0].name)")
        setupTableViewBackGroundPhoto()
//        }
    }
    
    
    func createRestaurants() {
        
        FourSquareService.searchVenues("restaurants") { (success, data) -> () in
            if let data =  data {
                FourSquareService.parseVenueResponse(data, completion: { (success, venues) -> () in
                    if let venues = venues {
                        
                        NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                            print(venues)
                            
                            self.venuesFromFourSquare = venues

                            self.itemTableView.reloadData()
                            
                            
                        })
                    }
                })
            }
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
        print(selectedCategory)
        guard let venuesCount = venuesFromFourSquare?.count else {
            return 0
        }
        return (venuesCount)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CategoryItem", forIndexPath: indexPath)
        if let venuesFromFourSquare = venuesFromFourSquare {
            let selectedPointOfInterest = venuesFromFourSquare[indexPath.row] as! Restaurant
        //        let selectedPointOfInterest = self.selectedCategory?.pointsOfInterest![indexPath.row]
        
        
        if(indexPath.row % 2 == 0) {
            cell.backgroundColor = UIColor.clearColor()

        } else {
            cell.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2);
        }
        
        cell.detailTextLabel?.backgroundColor = UIColor.clearColor()
        cell.textLabel?.backgroundColor = UIColor.clearColor()
        
        let pointOfInterestNameLabel = cell.viewWithTag(2) as! UILabel
        pointOfInterestNameLabel.text = selectedPointOfInterest.name
        let pointOfInterestDescriptionLabel = cell.viewWithTag(1) as! UILabel
        pointOfInterestDescriptionLabel.text = selectedPointOfInterest.shortDescription
        }
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let segueIdentifier = segueIdentifierForSegue(segue)
        
        switch segueIdentifier {
        case .POIDetailViewController:
            if  let POIDetailVC = segue.destinationViewController as? POIDetailViewController {
                let indexPath = self.itemTableView.indexPathForSelectedRow
                if let selectedRow = indexPath?.row {
                let selectedPOI = self.selectedCategory?.pointsOfInterest?[selectedRow]
                    POIDetailVC.selectedPOI = selectedPOI
                }
            }
        }
//        if segue.identifier == "POIDetailViewController" {
//            let POIDetailVC = segue.destinationViewController as? POIDetailViewController
//            let indexPath = self.itemTableView.indexPathForSelectedRow
//            if let selectedRow = indexPath?.row {
//                let selectedPOI = self.selectedCategory?.pointsOfInterest![selectedRow]
//                POIDetailVC?.selectedPOI = selectedPOI
//            }
//        }
    }
}
