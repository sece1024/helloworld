//
//  Weather7.swift
//  iOS-weather-hgx
//
//  Created by csq on 21/6/13.
//  Copyright © 2021年 HGX. All rights reserved.
//

import Foundation

class Weather7{
    var info: Dictionary<String, String>
    var data: [Dictionary<String, Any>]
    init() {
        self.info = ["cityid": "",
            "city":"",
            "cityEn":"",
            "country":"",
            "countryEn":"",
            "update_time":""]
        self.data = [[:],[:],[:],[:],[:],[:],[:]]
    }
    init(nsDic: NSDictionary) {
        self.info = ["cityid": "",
                     "city":"",
                     "cityEn":"",
                     "country":"",
                     "countryEn":"",
                     "update_time":""]
        self.data = [[:],[:],[:],[:],[:],[:],[:]]
        
        for k in self.info.keys{
            self.info[k] = nsDic.value(forKey: k) as! String?
        }
        var data = nsDic.value(forKey: "data") as! Array<Dictionary<String, Any>>
        for index in 0...data.count - 1{
            for name in data[index].keys{
                if name == "win"{
                    self.data[index][name] = data[index][name] as! Array<String>
                }else if name == "alarm"{
                    self.data[index][name] = data[index][name] as! Dictionary<String, String>
                }
                else if (name == "hours") || (name == "index"){
                    self.data[index][name] = data[index][name] as! Array<Dictionary<String, String>>
                }else{
                    self.data[index][name] = data[index][name]
                }
                
            }
        }
    }
}
