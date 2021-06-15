//
//  City.swift
//  iOS-weather-hgx
//
//  Created by csq on 21/6/10.
//  Copyright © 2021年 HGX. All rights reserved.
//

import Foundation

class City{
    var nowCity: String
    var cityList: [String]
    
    init(city_now: String, focus_list: [String]) {
        self.nowCity = city_now
        self.cityList = focus_list
    }
    init() {
        self.nowCity = ""
        
        self.cityList = []
    }
    
}
