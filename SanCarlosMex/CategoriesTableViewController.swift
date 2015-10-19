//
//  MainMenuViewController.swift
//  SanCarlosMex
//
//  Created by Alberto Vega Gonzalez on 7/13/15.
//  Copyright (c) 2015 Alberto Vega Gonzalez. All rights reserved.
//

import UIKit

class CategoriesTableViewController: UITableViewController {

  @IBOutlet var mainMenuTableView: UITableView!
  
  
  
  var categories = [Category]()
//  var categories = [Activity]()
  var restaurants = [Restaurant]()
  var beaches = [Beach]()
  var hotels = [Hotel]()
  var adventures = [Adventure]()
  

  var praise = "You are really good at this"
  
    override func viewDidLoad() {
        super.viewDidLoad()
//      createActivities()
      createRestaurants()
      createBeaches()
//      createRestaurants()
      createCategories()
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return categories.count
    
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("CategoryListItem", forIndexPath: indexPath)
    let index = indexPath.row
    let selectedActivity = self.categories[index]
    let activityNameTextLabel = cell.viewWithTag(1) as! UILabel
    activityNameTextLabel.text = selectedActivity.name
    return cell
  }
  
//  func createActivities()-> [Activity] {
//        
//    var boatRides = Activity()
//    boatRides.name = "Boat Rides"
//    boatRides.image = UIImage(named: "boatRides.JPG")
//    categories.append(boatRides)
//    
//    var horsebackRiding = Activity()
//    horsebackRiding.name = "Horse Riding"
//    horsebackRiding.image = UIImage(named:"horseRiding.JPG")
//    categories.append(horsebackRiding)
//    
//    var kayaking = Activity()
//    kayaking.name = "Kayaking"
//    kayaking.image = UIImage(named: "kayaking.JPG")
//    categories.append(kayaking)
//    
//    var hiking = Activity()
//    hiking.name = "Hiking"
//    hiking.image = UIImage(named: "hiking.JPG")
//    categories.append(hiking)
//    
//    var dining = Activity()
//    dining.name = "Dining"
//    dining.image = UIImage(named: "dining.JPG")
//    categories.append(dining)
//    
//    var sightseeing = Activity()
//    sightseeing.name = "Sightseeing"
//    sightseeing.image = UIImage(named: "sightseeing.JPG")
//    categories.append(sightseeing)
//    
//    var bathing = Activity()
//    bathing.name = "Bathing"
//    bathing.image = UIImage(named: "bathing.JPG")
//    categories.append(bathing)
//    
//    return categories
//  }
  
  func createRestaurants() {
    let bamboo = Restaurant(name: "Bamboo", description: "Asian Food", address: "Blvd Gabriel Estrada 137", features: "Bamboo also serves beer and wine and delivers anywhere in San Carlos", hours: "Wednesday trough Monday noon to 8pm", notes: "Located just across the street from Marina Terra", image: "dining.JPG", cuisine: "Bamboo serves a wide range of asia cuisine treats including Chines and Japanese menu items", phone: "622 226 1225")
    let piccolo = Restaurant(name: "Piccolo", description: "Italian Food", address: "Beltrones Avenue, San Carlos, Mexico", features: "Italian", hours: "Wed - Sat 6:30 pm - 11:00 pm", notes: "http://www.siestarealty.com/san_carlos_sonora_restaurants_bars_coffee.html", image: "dining.JPG", cuisine: "Italian", phone: "622-226-0503")
    restaurants += [bamboo, piccolo]
    print("The number of restaurants created: \(restaurants.count)")
    
  }
  
  func createBeaches() {
    let piedrasPintas = Beach(name: "Piedras Pintas", description: "This is another great location for snorkeling, diving and kayaking. Snorkeling and diving are good up both sides of the cove.", address: "To get here by car, pass the RV park on your right, drive over the topes, and then turn left before starting up the hill towards the Mirador.  Drive down a dirt road to the first beach in a string of little coves and sandy beaches.", features: "kayaking.JPG", hours: "No hour restrictions", notes: "A second cove and beach are further to the left.There are no shade structures on this beach, so bring an umbrella. There are also no facilities. There is plenty of room to park.", image: "kayaking.JPG", experience: "This is another great location for snorkeling, diving and kayaking. Snorkeling and diving are good up both sides of the cove.")
    let marinaTerraBeachClub = Beach(name: "Marinaterra Beach Club", description: "This is a great place to snorkel, dive, swim and kayak. It is a beautiful quiet area.", address: "Take the main road past the MarinaTerra Hotel, and then turn left at the roundabout and continue to follow the road towards the water", features: "This is a great place to snorkel, dive, swim and kayak. You can rent kayaks from the Beach Club (singles and doubles).", hours: "No hour restrictions", notes: "They do not rent snorkel equipment, so bring it with you if you want to snorkel. During jellyfish season, there tends to be a lot in this area, so take care.", image: "kayaking.JPG", experience: "http://www.whatsupsancarlos.com/beaches-san-carlos-mexico/")
    
    beaches += [piedrasPintas, marinaTerraBeachClub]

  }
  
  func createCategories () {
    
    let restaurantCategory = Category(name: "Restaurants", image: "dining.JPG", pointsofInterest: restaurants)
    let beachesCategory = Category(name: "Beaches", image: "kayaking.JPG", pointsofInterest: beaches)
    
    categories += [restaurantCategory,beachesCategory]
    
    print("The number of categories in the array is \(categories.count)")

  }
  
  
//     MARK: - Navigation

  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "ShowCategoryItemTableVC" {
      if let CategoryItemsTableViewController = segue.destinationViewController as? CategoryItemsTableViewController {
      
       let indexPath = self.tableView.indexPathForSelectedRow
        if let selectedRow = indexPath?.row {
       let selectedCategory = self.categories[selectedRow]
        print("the selected library in table view: \(selectedCategory.name)")
      CategoryItemsTableViewController.selectedCategory = selectedCategory
        CategoryItemsTableViewController.praise = praise
        }
      }
      }
//         Get the new view controller using segue.destinationViewController.
//         Pass the selected object to the new view controller.
    
    }
}
