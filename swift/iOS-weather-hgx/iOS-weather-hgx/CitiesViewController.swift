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
        
        self.setBkByName(name: "bk05", type: ".jpg", alpha: 0.90)

    }
    
    // 设置背景图片
    func setBkByName(name: String, type: String, alpha: CGFloat){
        let imageName = name + type
        let page = UIView(frame: self.view.bounds)
        //        page.backgroundColor = UIColor(red: 0x37/255, green: 0xba/255, blue: 0x46/255, alpha: 0.87)
        page.backgroundColor = UIColor(patternImage: UIImage(named:imageName)!)
        page.alpha = (alpha >= 0 && alpha < 1) ? alpha : 1
        
        self.view.addSubview(page)
        self.view.sendSubview(toBack: page)
        
    }
 
  
    @IBAction func save(_ sender: Any) {
        print("Button Save been clicked")
        self.performSegue(withIdentifier: "GoToHome", sender: nil)
        // 给列表添加新关注的城市
        for item in self.citiesBeFocusedNow{
            if !(self.finalCityList.contains(item)){
                self.finalCityList.append(item)
            }
        }
        // 从列表中删除取消关注的城市
        for item in self.finalCityList{
            if self.listCities.contains(item) && !(self.citiesBeFocusedNow.contains(item)){
                self.finalCityList.remove(at: self.finalCityList.index(of: item)!)
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
