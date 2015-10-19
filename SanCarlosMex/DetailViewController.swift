//
//  DetailViewController.swift
//  SanCarlosMex
//
//  Created by Alberto Vega Gonzalez on 6/12/15.
//  Copyright (c) 2015 Alberto Vega Gonzalez. All rights reserved.
//

import UIKit
import Social

class DetailViewController: UIViewController {
  
  @IBOutlet weak var activityPhoto: UIImageView!
  @IBOutlet weak var activityNameLabel: UILabel!
  @IBOutlet weak var photoDescriptionLabel: UILabel!
  
  var selectedCategory: Category?
  var praise: String?
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print(praise)
    print("The selected activity in DetailViewController: \(selectedCategory)")
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Action, target: self, action: "shareTapped")
    self.activityNameLabel.text = self.selectedCategory?.name
    self.photoDescriptionLabel.text = self.selectedCategory?.name
    self.activityPhoto.image = self.selectedCategory?.image
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func shareTapped() {
    let vc = UIActivityViewController(activityItems: [activityPhoto.image!], applicationActivities: [])
    presentViewController(vc, animated: true, completion: nil)
  }
  
  func shareOnFacebookTapped()  {
    let vc = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
    vc.setInitialText("Check out this beautiful place! It's San Carlos, Mexico")
    vc.addImage(activityPhoto.image!)
    vc.addURL(NSURL(string: "http://www.discoversancarlos.org/home"))
    presentViewController(vc, animated: true, completion: nil)
  }
  
  func shareOnTwitterTapped() {
    let vc = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
    vc.setInitialText("Check out this beautiful place! It's San Carlos, Mexico")
    vc.addImage(activityPhoto.image!)
    vc.addURL(NSURL(string: "http://www.discoversancarlos.org/home"))
    presentViewController(vc, animated: true, completion: nil)
  }
  /*
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
  // Get the new view controller using segue.destinationViewController.
  // Pass the selected object to the new view controller.
  }
  */
  
  @IBAction func shareOnFacebookButtonPressed(sender: UIButton) {
    shareOnFacebookTapped()
  }
  
  @IBAction func shareOnTwitterButtonPressed(sender: AnyObject) {
    shareOnTwitterTapped()
  }
}
