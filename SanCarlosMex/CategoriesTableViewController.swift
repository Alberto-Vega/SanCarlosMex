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
  var activities = [Activity]()
  var restaurants = [Restaurant]()
  var beaches = [Beach]()
  var hotels = [Hotel]()
  var adventures = [Adventure]()
  

  var praise = "You are really good at this"
  
    override func viewDidLoad() {
        super.viewDidLoad()
      createActivities()
      print("The number of activities in the array is \(activities.count)")
      createRestaurants()
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
    return activities.count
    
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("ActivityListItem", forIndexPath: indexPath)
    let index = indexPath.row
    let selectedActivity = self.activities[index]
    let activityNameTextLabel = cell.viewWithTag(1) as! UILabel
    activityNameTextLabel.text = selectedActivity.name
    return cell
  }
  
  func createActivities()-> [Activity] {
        
    var boatRides = Activity()
    boatRides.name = "Boat Rides"
    boatRides.image = UIImage(named: "boatRides.JPG")
    activities.append(boatRides)
    
    var horsebackRiding = Activity()
    horsebackRiding.name = "Horse Riding"
    horsebackRiding.image = UIImage(named:"horseRiding.JPG")
    activities.append(horsebackRiding)
    
    var kayaking = Activity()
    kayaking.name = "Kayaking"
    kayaking.image = UIImage(named: "kayaking.JPG")
    activities.append(kayaking)
    
    var hiking = Activity()
    hiking.name = "Hiking"
    hiking.image = UIImage(named: "hiking.JPG")
    activities.append(hiking)
    
    var dining = Activity()
    dining.name = "Dining"
    dining.image = UIImage(named: "dining.JPG")
    activities.append(dining)
    
    var sightseeing = Activity()
    sightseeing.name = "Sightseeing"
    sightseeing.image = UIImage(named: "sightseeing.JPG")
    activities.append(sightseeing)
    
    var bathing = Activity()
    bathing.name = "Bathing"
    bathing.image = UIImage(named: "bathing.JPG")
    activities.append(bathing)
    
    return activities
  }
  
  func createRestaurants() {
    let bamboo = Restaurant(name: "Bamboo", description: "Asian Food", address: "Blvd Gabriel Estrada 137", features: "Bamboo also serves beer and wine and delivers anywhere in San Carlos", hours: "Wednesday trough Monday noon to 8pm", notes: "Located just across the street from Marina Terra", image: <#T##String#>, cuisine: "Bamboo serves a wide range of asia cuisine treats including Chines and Japanese menu items", phone: "622 226 1225")
    let piccolo = Restaurant(name: "Piccolo", description: "Italian Food", address: "Beltrones Avenue, San Carlos, Mexico", features: "Italian", hours: "Wed - Sat 6:30 pm - 11:00 pm", notes: "http://www.siestarealty.com/san_carlos_sonora_restaurants_bars_coffee.html", image: <#T##String#>, cuisine: "Italian", phone: "622-226-0503")
    restaurants += [bamboo, piccolo]
    
  }
  
  
//     MARK: - Navigation

  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "ShowDetailViewController" {
      if let dvc = segue.destinationViewController as? DetailViewController {
      
       let indexPath = self.tableView.indexPathForSelectedRow
        if let selectedRow = indexPath?.row {
       let selectedActivity = self.activities[selectedRow]
        print("the selected library in table view: \(selectedActivity.name)")
      dvc.selectedActivity = selectedActivity
        dvc.praise = praise
        }
      }
      }
//         Get the new view controller using segue.destinationViewController.
//         Pass the selected object to the new view controller.
    
    }
}
