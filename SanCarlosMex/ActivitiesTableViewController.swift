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
        setupTableViewBackGroundPhoto()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func createActivities()-> [Activity] {
        
        var boatRides = Activity()
        boatRides.name = "Sailing"
        boatRides.image = UIImage(named: "elPilar.JPG")
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
        hiking.image = UIImage(named: "nacapule.jpg")
        activities.append(hiking)
        
        var dining = Activity()
        dining.name = "Dining"
        dining.image = UIImage(named: "dining.JPG")
        activities.append(dining)
        
        var sightseeing = Activity()
        sightseeing.name = "Sightseeing"
        sightseeing.image = UIImage(named: "piedrasPintas.jpg")
        activities.append(sightseeing)
        
        var swimming = Activity()
        swimming.name = "Swimming"
        swimming.image = UIImage(named: "puntaChencho.jpg")
        activities.append(swimming)
        
        let natureWatching = Activity(name: "Nature Watching", image: UIImage(named: "delfines.jpg"))
        activities.append(natureWatching)
        
        return activities
    }
    
    // MARK: TableView
    
    func setupTableViewBackGroundPhoto() {
        
        mainMenuTableView.backgroundView = UIImageView(image: UIImage(named: "piedrasPintas.jpg"))
        mainMenuTableView.backgroundView!.contentMode = UIViewContentMode.scaleAspectFill
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activities.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityListItem", for: indexPath)

        if((indexPath as NSIndexPath).row % 2 == 0) {
            cell.backgroundColor = UIColor.clear
        } else {
            cell.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        }
        
        let selectedActivity = self.activities[(indexPath as NSIndexPath).row]
        let activityNameTextLabel = cell.viewWithTag(1) as! UILabel
        activityNameTextLabel.text = selectedActivity.name
        return cell
    }
   
    //     MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "DetailViewController" {
            
            if let dvc = segue.destination as? DetailViewController {
                
                let indexPath = self.tableView.indexPathForSelectedRow
                if let selectedRow = (indexPath as NSIndexPath?)?.row {
                    
                    let selectedActivity = self.activities[selectedRow]
                    dvc.selectedActivity = selectedActivity
                }
            }
        }
    }
}
