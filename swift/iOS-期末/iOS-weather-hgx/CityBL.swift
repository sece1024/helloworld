//
//  CityBL.swift
//  iOS-weather-hgx
//
//  Created by csq on 21/6/10.
//  Copyright © 2021年 HGX. All rights reserved.
//

import Foundation

class CityBL{
    // add
    func add(cityname: String){
        let dao: CityDAO = CityDAO.sharedInstance
        dao.add(cityname)
    }
    func add(cityNameList: [String]){
        for item in cityNameList{
            self.add(cityname: item)
        }
    }
    
    // search
    func getAll() -> [String]{
        let dao: CityDAO = CityDAO.sharedInstance
        return dao.findAll()
    }
    
    // delete all data
    func clear(){
        let dao: CityDAO = CityDAO.sharedInstance
        dao.deleteAll()
        
        
    }
    
    // 更新
    func update(cityList: [String]){
        self.clear()
        self.add(cityNameList: cityList)
        print("根据 \(cityList) 更新数据库")
        self.printAll()
    }
    
    func printAll(){
        let dao: CityDAO = CityDAO.sharedInstance
        print(dao.findAll())
    }
}
