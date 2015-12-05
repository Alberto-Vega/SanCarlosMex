//
//  HomeViewController.swift
//  SanCarlosMex
//
//  Created by Alberto Vega Gonzalez on 6/13/15.
//  Copyright (c) 2015 Alberto Vega Gonzalez. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var RoundTetakawiImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RoundTetakawiImage.layer.cornerRadius = RoundTetakawiImage.frame.size.width/2
        self.RoundTetakawiImage.clipsToBounds = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
