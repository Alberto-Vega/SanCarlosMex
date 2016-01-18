//
//  MainMenuViewController.swift
//  SanCarlosMex
//
//  Created by Alberto Vega Gonzalez on 7/13/15.
//  Copyright (c) 2015 Alberto Vega Gonzalez. All rights reserved.
//

import UIKit
import MapKit


class CategoriesTableViewController: UITableViewController {
    
    @IBOutlet var mainMenuTableView: UITableView!
    
    var categories = [Category]()
    var restaurants = [Restaurant]()
    var beaches = [Beach]()
    var hotels = [Hotel]()
    var adventures = [Adventure]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupTableViewBackGroundPhoto()
        
        
        createRestaurants()
        createBeaches()
//        createCategories()

//        print("In view did load we have cuisine: \(restaurants[0].cuisine) name \(restaurants[0].name)")
//        print("ViewdidLoad categories: \(categories.count)")
//        print("In view did load we have cuisine: \(categories[0].pointsOfInterest!.count)")
//        name \(categories[0].pointsOfInterest![0].name)")

    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
//        print("In view didApper we have pointsofInterest: \(categories[0].pointsOfInterest!.count)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: helper functions.
    
    func createCategories ()-> [Category] {
        
        let restaurantCategory = Category(name: "Restaurants", image: "dining.JPG", pointsOfInterest: restaurants)
        let beachesCategory = Category(name: "Beaches", image: "kayaking.JPG", pointsOfInterest: beaches)
        print(restaurants.count)
        print(restaurantCategory.pointsOfInterest?.count)
        let hotelCategory = Category(name: "Hotels", image: "kayaking.JPG", pointsOfInterest: restaurants)
        let barCategory = Category(name: "Bars", image: "kayaking.JPG", pointsOfInterest: restaurants)
        let adventuresCategory = Category(name: "Adventures", image: "kayaking.JPG", pointsOfInterest: restaurants)
        let fitnessCategory = Category(name: "Fitness", image: "kayaking.JPG", pointsOfInterest: restaurants)
        let trailsCategory = Category(name: "Trails", image: "kayaking.JPG", pointsOfInterest: restaurants)
        categories += [restaurantCategory, beachesCategory, hotelCategory, barCategory, adventuresCategory, fitnessCategory, trailsCategory]
        self.mainMenuTableView.reloadData()
        return categories
    }
    
    
    func createRestaurants() {
        
        FourSquareService.searchVenues("Restaurants") { (success, data) -> () in
            if let data =  data {
                FourSquareService.parseVenueResponse(data, completion: { (success, venues) -> () in
                    if let venues = venues {
                        NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                            self.restaurants = venues
                            self.createCategories()
                        })
                    }
                })
            }
        }
//        let bamboo = Restaurant(name: "Bamboo", shortDescription: "Asian Food", address: "Blvd Gabriel Estrada 137", features: "Located just across the street from Marina Terra", hours: "Wednesday trough Monday noon to 8pm", notes: "Bamboo also serves beer and wine and delivers anywhere in San Carlos", image: "bamboo.jpg", latitude:27.9479905, longitude: -111.0529558 , cuisine: "Bamboo serves a wide range of asia cuisine treats including Chinese and Japanese menu items", phone: "622 226 1225")
//        let piccolo = Restaurant(name: "Piccolo", shortDescription: "Italian Food", address: "Beltrones Avenue, San Carlos, Mexico", features: "Not only is the food really good, but the atmosphere is cozy and inviting.", hours: "Wed - Sat 6:30 pm - 11:00 pm", notes: "Great food and good service.", image: "piccolo.jpg",latitude: 27.9603909, longitude: -111.0347736, cuisine: "Italian", phone: "622-226-0503")
//        restaurants += [bamboo, piccolo]
//        print("The number of restaurants created: \(restaurants.count)")
    }
    
    func createBeaches() {
        let piedrasPintas = Beach(name: "Piedras Pintas", shortDescription: "Public Beach", address: "To get here by car, pass the RV park on your right, drive over the topes, and then turn left before starting up the hill towards the Mirador.  Drive down a dirt road to the first beach in a string of little coves and sandy beaches.", features: "This is another great location for snorkeling, diving and kayaking.", hours: "No hour restrictions", notes: "Snorkeling and diving are good up both sides of the cove.", image: "piedrasPintas.jpg",latitude: 27.9620957, longitude: -111.1019247, experience: "This is another great location for snorkeling, diving and kayaking. Snorkeling and diving are good up both sides of the cove.")
        let marinaTerraBeachClub = Beach(name: "Marinaterra", shortDescription: "Semi-Private Beach", address: "Take the main road past the MarinaTerra Hotel, and then turn left at the roundabout and continue to follow the road towards the water", features: "This is a great place to snorkel, dive, swim and kayak. It is a beautiful quiet area.", hours: "No hour restrictions", notes: "You can rent kayaks from the Beach Club (singles and doubles).They do not rent snorkel equipment, so bring it with you if you want to snorkel. During jellyfish season, there tends to be a lot in this area, so take care.", image: "kayaking.JPG",latitude: 27.9466385, longitude: -111.0613993, experience: "http://www.whatsupsancarlos.com/beaches-san-carlos-mexico/")
        
        beaches += [piedrasPintas, marinaTerraBeachClub]
    }
    
    // MARK: TableView
    
    func setupTableViewBackGroundPhoto() {
        
        mainMenuTableView.backgroundView = UIImageView(image: UIImage(named: "piedrasPintas.jpg"))
        mainMenuTableView.backgroundView!.contentMode = UIViewContentMode.ScaleAspectFill
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return categories.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CategoryListItem", forIndexPath: indexPath)
        
        if(indexPath.row % 2 == 0) {
            
            cell.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        } else {
            
            cell.backgroundColor = UIColor.clearColor()

        }
        
        let selectedActivity = self.categories[indexPath.row]
        let activityNameTextLabel = cell.viewWithTag(1) as! UILabel
        activityNameTextLabel.text = selectedActivity.name
        return cell
    }
    
    //     MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowCategoryItems" {
            if let CategoryItemsTableViewController = segue.destinationViewController as? CategoryItemsTableViewController {
                
                let indexPath = self.tableView.indexPathForSelectedRow
                if let selectedRow = indexPath?.row {
                    let selectedCategory = self.categories[selectedRow]
                    CategoryItemsTableViewController.selectedCategory? = selectedCategory
                    
//                    CategoryItemsTableViewController.selectedCategory?.pointsOfInterest = self.restaurants

            
//            if let tabBarController = segue.destinationViewController as? UITabBarController {
//                if let categoryItemsTableViewController = tabBarController.viewControllers![0] as? CategoryItemsTableViewController {
//                    if let indexPath = self.tableView.indexPathForSelectedRow {
//                    let selectedCategory =  self.categories[indexPath.row]
//                    
//                    categoryItemsTableViewController.selectedCategory = selectedCategory
//                    }
//                    
                }
            }
        }
    }
}