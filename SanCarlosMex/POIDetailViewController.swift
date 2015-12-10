//
//  POIDetailViewController.swift
//  SanCarlosMex
//
//  Created by Alberto Vega Gonzalez on 12/1/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {

    @IBOutlet weak var POIImageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var featuresLabel: UILabel!
    @IBOutlet weak var nameLocationLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    var selectedPOI: PointOfInterest?
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        POIImageView.image = selectedPOI?.image
        categoryLabel.text = selectedPOI?.name
        headlineLabel.text = selectedPOI?.shortDescription
        descriptionLabel.text = selectedPOI?.features
        featuresLabel.text = selectedPOI?.notes
        nameLocationLabel.text = selectedPOI?.name
        addressLabel.text = ("Business hours: \(selectedPOI!.hours) address: \(selectedPOI!.address)")
        self.containerView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
