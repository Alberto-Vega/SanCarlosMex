//
//  HotelSearchTableViewCell.swift
//  Expedia
//
//  Created by Alberto Vega Gonzalez on 8/19/16.
//  Copyright © 2016 Alberto Vega Gonzalez. All rights reserved.
//

import UIKit

class HotelSearchTableViewCell: UITableViewCell {

    @IBOutlet weak var hotelName: UILabel!
    @IBOutlet weak var hotelStarRating: UILabel!
    @IBOutlet weak var hotelThumbnail: UIImageView!
    @IBOutlet weak var hotelDistanceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.hotelName.textColor = UIColor.lightGray
        self.hotelStarRating.textColor = UIColor.blue
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
