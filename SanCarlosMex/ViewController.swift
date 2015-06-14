//
//  ViewController.swift
//  SanCarlosMex
//
//  Created by Alberto Vega Gonzalez on 6/12/15.
//  Copyright (c) 2015 Alberto Vega Gonzalez. All rights reserved.
//

import UIKit

class ViewController : UIViewController, UITableViewDataSource {
  
  @IBOutlet weak var tableView: UITableView!
  
  var activities = [Activity]()

    override func viewDidLoad() {
    
    super.viewDidLoad()
    
    self.tableView.dataSource = self
    
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

    
  }

  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.activities.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
    let activityToDisplay = self.activities[indexPath.row]
    cell.textLabel?.text = activityToDisplay.name
    
    return cell
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "ShowDetailViewController" {
      
      let detailViewController = segue.destinationViewController as! DetailViewController
      
      let indexPath = self.tableView.indexPathForSelectedRow()
      let selectedRow = indexPath!.row
      let selectedActivity = self.activities[selectedRow]
      println(selectedActivity.name)
      detailViewController.selectedActivity = selectedActivity
      
    }
  }

}

