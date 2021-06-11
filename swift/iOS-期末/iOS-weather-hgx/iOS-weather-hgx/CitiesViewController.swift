//
//  CitiesViewController.swift
//  iOS-weather-hgx
//
//  Created by csq on 21/6/10.
//  Copyright © 2021年 HGX. All rights reserved.
//

import UIKit

class CitiesViewController: UITableViewController {
    // get from priorate view
    var listCities: [String]!
    var provinceName: String!
    // cities had been choiced
//    var focusCitiesIndex = Array<Int>()
    
    // bl
    var cityBl = CityBL()
    // 当前被关注城市
    var citiesBeFocusedNow = Array<String>()
    // 根据该城市列表更新数据库
    private var finalCityList: [String]!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = self.provinceName
        self.finalCityList = self.cityBl.getAll()

    }
 
  
    @IBAction func save(_ sender: Any) {
        print("Button Save been clicked")
        self.performSegue(withIdentifier: "GoToHome", sender: nil)
        for item in self.citiesBeFocusedNow{
            if !(self.finalCityList.contains(item)){
                self.finalCityList.append(item)
            }
        }
        cityBl.update(cityList: self.finalCityList)
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listCities.count
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let allCitiesBeFocused: [String] = self.cityBl.getAll()
        let cellIdenfifier = "CellIdentifier"
        let cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: cellIdenfifier, for: indexPath)
        
        let row = indexPath.row
        cell.textLabel?.text = self.listCities[row]
        // 当前单元格中的城市名，在所有被关注城市列表之中
        if allCitiesBeFocused.contains(self.listCities[row]){
            cell.accessoryType = .checkmark
            self.citiesBeFocusedNow.append(self.listCities[row])
        }else{
            cell.accessoryType = .none
        }
        
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        let name: String = (cell?.textLabel?.text)! as String
        if self.citiesBeFocusedNow.contains(name){
            cell?.accessoryType = .none
            self.citiesBeFocusedNow.remove(at: self.citiesBeFocusedNow.index(of: name)!)
        }else{
            cell?.accessoryType = .checkmark
            self.citiesBeFocusedNow.append(name)
        }
        
//        if self.focusCitiesIndex.contains(indexPath.row){
//            
//            
//            cell?.accessoryType = .none
//            self.focusCitiesIndex.remove(at: self.listCities.index(of: name)!)
//            self.citiesBeFocusedNow.remove(at: self.citiesBeFocusedNow.index(of: name)!)
//            
//        }else{
//            cell?.accessoryType = .checkmark
//            self.focusCitiesIndex.append(indexPath.row)
//            self.citiesBeFocusedNow.append(name)
//            
//        }

        for item in self.citiesBeFocusedNow{
            print(item)
            
        }
        
    }
    
    

}
