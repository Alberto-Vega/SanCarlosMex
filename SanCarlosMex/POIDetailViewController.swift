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
    
    var selectedPOI: PointOfInterest?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        POIImageView.image = selectedPOI?.image
        print(selectedPOI?.image)
        categoryLabel.text = selectedPOI?.name
        headlineLabel.text = selectedPOI?.description
        
        
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
