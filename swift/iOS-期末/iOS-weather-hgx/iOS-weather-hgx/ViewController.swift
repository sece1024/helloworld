//
//  ViewController.swift
//  iOS-weather-hgx
//
//  Created by csq on 21/6/7.
//  Copyright © 2021年 HGX. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    
    var cityBl = CityBL()
    public static var city = City()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        // 没有选择城市，则指定一个
        if ViewController.city.nowCity == ""{
            ViewController.city.nowCity = self.cityBl.getAll()[0]
        }
        self.titleLabel.text = ViewController.city.nowCity
        ViewController.city.cityList = cityBl.getAll()
        print("self.city.cityList = \(ViewController.city.cityList)")
        print("cityNow: \(ViewController.city.nowCity)")
        
    }
    
    @IBAction func onGet(_ sender: UIButton) {
        
                let url = "http://www.tianqiapi.com/api?version=v6&appid=38167911&appsecret=DuzVen06" + "&city=" + ViewController.city.nowCity
        
                Http.request(method: .GET, url: url, params: ["a":"list","c":"data","type":1], complete: {r in
        
//                    print("请求结果：",r)
                    let temp = self.jsonStrToDic(str: r)
                    self.dicToWeatherDic(nsDic: temp)
                    
        
                }, error:{error in
        
                    print("请求出错了:",error.debugDescription)
                    
                })
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func jsonStrToDic(str :String)->NSDictionary{
        let jsonData = str.data(using: .utf8)
        
        do{
            let jsonObj = try! JSONSerialization.jsonObject(with: jsonData!, options: .mutableContainers) as! NSDictionary
//            for k in jsonObj.allKeys{
//                print("\(k)\t\(jsonObj[k]!)")
//            }
            return jsonObj
        }
        
    }
    func dicToWeatherDic(nsDic: NSDictionary) /*-> Dictionary<String, String>*/{
        var dic = Dictionary<String, String>()
        for index in 0...nsDic.count - 2{
            dic[nsDic.allKeys[index] as! String] = (nsDic.allValues[index] as! String)
        }
        
//        return dic
        let wea = Weather(dic: dic)
        print("wea.weaDic = \(wea.weaDic)")
    }

    func testReadCityPlist(){
//        let url = Bundle.main.url(forResource: "city", withExtension: "plist")
//        let data = try? Data(contentsOf: url!)
//        let cityDic: Dictionary<String, NSArray> = try! PropertyListSerialization.propertyList(from: data!, options: [], format: nil) as! Dictionary
//        print(cityDic["北京"]!)
        
        let cityPath = Bundle.main.path(forResource: "city", ofType: "plist")
        let cityNsDic = NSDictionary(contentsOfFile: cityPath!)!
        let cityDic: Dictionary<String, Array<String>> = cityNsDic as! Dictionary
        print(cityDic["北京"]!)
    }
    func loadData(){
        let path = Bundle.main.path(forResource: "city2", ofType: "json")
        
        var dicData = Dictionary<String, NSArray>()
        let jsonData = try! Data(contentsOf: URL(fileURLWithPath: path!))
        
        do {
            let jsonObj = (try! JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers)) as! NSDictionary
            let list_keys = jsonObj.allKeys
//            print(list_keys.count)
//            print(list_keys)

            for item in list_keys{
                dicData[item as! String] = jsonObj.object(forKey: item) as? NSArray
                
            }
//            let path2 = NSHomeDirectory() as NSString
            let filePath2: String = NSHomeDirectory() + "/Documents/city.plist"
            print(filePath2)
            let nsDic = dicData as NSDictionary
            nsDic.write(toFile: filePath2, atomically: true)
            
            
    }

}
}

