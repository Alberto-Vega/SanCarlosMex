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
    @IBOutlet weak var ContainerView: UIView!
    
    var selectedActivity: Activity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabelsAndButtons()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupLabelsAndButtons() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Action, target: self, action: "shareTapped")
        self.activityNameLabel.text = self.selectedActivity?.name
        self.photoDescriptionLabel.text = self.selectedActivity?.createAndSelectARandomDescription()
        self.activityPhoto.image = self.selectedActivity?.image
        self.ContainerView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3);
    }
    
    //MARK: Social
    
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
    
    @IBAction func shareOnFacebookButtonPressed(sender: UIButton) {
        shareOnFacebookTapped()
    }
    
    @IBAction func shareOnTwitterButtonPressed(sender: AnyObject) {
        shareOnTwitterTapped()
    }
}
