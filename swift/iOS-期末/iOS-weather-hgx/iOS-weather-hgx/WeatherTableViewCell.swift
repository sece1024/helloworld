//
//  WeatherTableViewCell.swift
//  iOS-weather-hgx
//
//  Created by csq on 21/6/14.
//  Copyright © 2021年 HGX. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    @IBOutlet weak var weaImage: UIImageView!
    @IBOutlet weak var labelWeek: UILabel!
    @IBOutlet weak var labelDescribe: UILabel!
    @IBOutlet weak var labelTem: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
