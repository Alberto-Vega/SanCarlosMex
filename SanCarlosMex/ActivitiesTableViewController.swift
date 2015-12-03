//
//  MainMenuViewController.swift
//  SanCarlosMex
//
//  Created by Alberto Vega Gonzalez on 7/13/15.
//  Copyright (c) 2015 Alberto Vega Gonzalez. All rights reserved.
//

import UIKit

class ActivitiesTableViewController: UITableViewController {
    
    @IBOutlet var mainMenuTableView: UITableView!
    var activities = [Activity]()
    override func viewDidLoad() {
        super.viewDidLoad()
        createActivities()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
    
    
    //     MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "DetailViewController" {
            
            if let dvc = segue.destinationViewController as? DetailViewController {
                
                let indexPath = self.tableView.indexPathForSelectedRow
                if let selectedRow = indexPath?.row {
                    
                    let selectedActivity = self.activities[selectedRow]
                    dvc.selectedActivity = selectedActivity
                }
            }
        }
    }
}
