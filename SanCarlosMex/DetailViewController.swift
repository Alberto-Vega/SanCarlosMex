//
//  DetailViewController.swift
//  SanCarlosMex
//
//  Created by Alberto Vega Gonzalez on 6/12/15.
//  Copyright (c) 2015 Alberto Vega Gonzalez. All rights reserved.
//

import UIKit
import Foundation

class DetailViewController: UIViewController {
  
  @IBOutlet weak var activityPhoto: UIImageView!
  @IBOutlet weak var activityNameLabel: UILabel!
  @IBOutlet weak var photoDescriptionLabel: UILabel!
  
  var selectedActivity: Activity!

    override func viewDidLoad() {
        super.viewDidLoad()
      self.activityNameLabel.text = self.selectedActivity.name
      self.photoDescriptionLabel.text = self.selectedActivity.randomDescription()
      self.activityPhoto.image = self.selectedActivity.image
      
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
