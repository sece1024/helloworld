//
//  ProvincesTableViewController.swift
//  iOS-weather-hgx
//
//  Created by csq on 21/6/10.
//  Copyright © 2021年 HGX. All rights reserved.
//

import UIKit

class ProvincesTableViewController: UITableViewController {
    // dictionary of procinces
    var dicProvinces: [String: Any]!
    // keys of dicProvinces
    var listData: [String]!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        let cityPath = Bundle.main.path(forResource: "city", ofType: "plist")
        let cityNsDic = NSDictionary(contentsOfFile: cityPath!)!
        let cityDic: Dictionary<String, Array<String>> = cityNsDic as! Dictionary
        
        self.dicProvinces = cityDic
        self.listData = cityNsDic.allKeys as! [String]
        self.title = "选择省份"
        print(listData[0])
        
        self.setBkByName(name: "bk05", type: ".jpg", alpha: 0.94)
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.listData.count
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "PROVINCE"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)

        // Configure the cell...
        let row = indexPath.row
        cell.textLabel?.text = self.listData[row]

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ShowSelectedProvince"{
            
            let citiesViewController = segue.destination as! CitiesViewController
            let indexPath = self.tableView.indexPathForSelectedRow! as IndexPath
            let selectedIndex = indexPath.row
            
            let selectName = self.listData[selectedIndex]
            citiesViewController.listCities = self.dicProvinces[selectName] as! [String]
            citiesViewController.provinceName = selectName
            
    }
    }

}
