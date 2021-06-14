//
//  Weather7DaysTableViewController.swift
//  iOS-weather-hgx
//
//  Created by csq on 21/6/13.
//  Copyright © 2021年 HGX. All rights reserved.
//

import UIKit

class Weather7DaysTableViewController: UITableViewController {
    var wea7: Weather7!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.wea7 =  ViewController.weather7
//        self.setBkByName(name: "bk04", type: ".jpg", alpha: 0.5)
    }
    
    // 设置背景图片
//    func setBkByName(name: String, type: String, alpha: CGFloat){
//        let imageName = name + type
//        let page = UIView(frame: self.view.bounds)
//        //        page.backgroundColor = UIColor(red: 0x37/255, green: 0xba/255, blue: 0x46/255, alpha: 0.87)
//        page.backgroundColor = UIColor(patternImage: UIImage(named:imageName)!)
//        page.alpha = (alpha >= 0 && alpha < 1) ? alpha : 1
//        
//        self.view.addSubview(page)
//        self.view.sendSubview(toBack: page)
//        
//    }

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
        return self.wea7.data.count
    }

    @IBAction func onBack(_ sender: Any) {
        self.dismiss(animated: true) {
            ()-> Void in
            print("关闭模态视图")
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WEATHERS", for: indexPath) as! WeatherTableViewCell

        // Configure the cell...
        let row = indexPath.row
        cell.weaImage.image = UIImage(named: ((wea7.data[row]["wea_img"] as! String) + ".png"))
        cell.labelDescribe.text = (self.wea7.data[row]["wea"] as! String)
        cell.labelTem.text = ((self.wea7.data[row]["tem1"] as! String) + "/" + (self.wea7.data[row]["tem2"] as! String))
        cell.labelWeek.text = self.wea7.data[row]["week"] as! String?
        return cell
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You select indexPath.row: \(indexPath.row)")
            

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
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//        if segue.identifier == "SHOWDETAIL"{
//            let detailView = segue.destination as! DetailViewController
//            self.present(detailView, animated: true, completion: {
//                detailView.labelTest.text = "test"
//            })
//            
//        }else{
//            print("identifier is not SHOWDETAIL")
//        }
//        
//    }

   

}
