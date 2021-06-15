//
//  Weather.swift
//  iOS-weather-hgx
//
//  Created by csq on 21/6/12.
//  Copyright © 2021年 HGX. All rights reserved.
//

import Foundation
// 天气类
// 参数(14)：日期    星期  更新时间    城市名 天气情况    图片名 当前温度    高温  低温  风向  风力等级    湿度  空气质量    空气质量描述
class Weather{
    var weaDic: Dictionary<String, String>
    
    init() {
        self.weaDic = ["city": "", "win_speed": "", "win_meter": "", "countryEn": "", "cityid": "", "week": "", "pressure": "", "tem": "", "wea_img": "", "humidity": "", "visibility": "", "date": "", "cityEn": "", "air": "", "tem1": "", "update_time": "", "tem2": "", "win": "", "air_tips": "", "air_level": "", "air_pm25": "", "wea": "", "country": ""]
    }
    init(dic: Dictionary<String, String>) {
        self.weaDic = Dictionary<String, String>()
        for k in dic.keys{
            self.weaDic[k] = dic[k]
        }
    }
    
    /*
    var date: String
    var week: String
    var update_time: String
    var city: String
    var wea: String
    var wea_img: String
    var tem: String
    var tem1: String
    var tem2: String
    var win: String
    var win_speed: String
    var humidity: String
    var air_level: String
    var air_tips: String
    init() {
        self.date = ""
        self.week = ""
        self.update_time = ""
        self.city = ""
        self.wea = ""
        self.wea_img = ""
        self.tem = ""
        self.tem1 = ""
        self.tem2 = ""
        self.win = ""
        self.win_speed = ""
        self.humidity = ""
        self.air_level = ""
        self.air_tips = ""
    }
    init(date: String, week: String, update_time: String, city: String,  wea: String, wea_img: String, tem: String, tem1: String, tem2: String, win: String, win_speed: String, humidity: String, air_level: String, air_tips: String) {
        self.date = date
        self.week = week
        self.update_time = update_time
        self.city = city
        self.wea = wea
        self.wea_img = wea_img
        self.tem = tem
        self.tem1 = tem1
        self.tem2 = tem2
        self.win = win
        self.win_speed = win_speed
        self.humidity = humidity
        self.air_level = air_level
        self.air_tips = air_tips
    }
 */
}
