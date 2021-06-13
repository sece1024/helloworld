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
    
    @IBOutlet weak var imgToday: UIImageView!
    @IBOutlet weak var imgTomorrow: UIImageView!
    @IBOutlet weak var imgAfterTom: UIImageView!
    
    @IBOutlet weak var labelToday: UILabel!
    @IBOutlet weak var labelTom: UILabel!
    @IBOutlet weak var labelAfterTom: UILabel!
    
    @IBOutlet weak var temToday: UILabel!
    @IBOutlet weak var temTom: UILabel!
    @IBOutlet weak var temAfterTom: UILabel!
    
    @IBOutlet weak var headTem: UILabel!
    @IBOutlet weak var headDesc: UILabel!
    
    
    
    
    var cityBl = CityBL()
    public static var city = City()
//    public static var weather7: Weather7

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        // 没有选择城市，则指定一个
        let name: String = self.cityBl.getFocuedCity()
        
        if name == ""{
            ViewController.city.nowCity = self.cityBl.getAll()[0]
            self.cityBl.setFocuedCity(name: self.cityBl.getAll()[0])
        }else{
            ViewController.city.nowCity = name
        }
        
        // 设置城市名
        self.titleLabel.text = ViewController.city.nowCity
        
        
        ViewController.city.cityList = cityBl.getAll()
        print("self.city.cityList = \(ViewController.city.cityList)")
        print("当前城市 cityNow: \(ViewController.city.nowCity)")
        
        self.updateWeather()
        
    }
    
    @IBAction func onGet(_ sender: UIButton) {
        
       self.updateWeather()
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func jsonStrToNsdic(str :String)->NSDictionary{
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
    func nsDicToWeather7(nsDic: NSDictionary) -> Weather7{
        let wea7 = Weather7(nsDic: nsDic)
//        print("wea7.info: \(wea7.info)\nwea7.data: \(wea7.data[0])")
        return wea7
    }
    
    // 根据当前城市名更新天气
    func updateWeather(){
        var wea7: Weather7!
        
        
        //        cityBl.setFocuedCity(name: ViewController.city.nowCity)
        //        print("尝试修改当前城市的plist文件: \(self.cityBl.getFocuedCity())")
        
        let url = "http://www.tianqiapi.com/api?version=v1&appid=38167911&appsecret=DuzVen06" + "&city=" + ViewController.city.nowCity
        
        Http.request(method: .GET, url: url, params: ["a":"list","c":"data","type":1], complete: {r in
            
            
            let temp = self.jsonStrToNsdic(str: r)
            wea7 = self.nsDicToWeather7(nsDic: temp)
            // 给天气的静态变量赋值
//            ViewController.weather7 = wea7
            //                    self.labelToday.text = "今天～" + (wea7.data[0]["wea"] as! String)
            //                    self.temToday.text = (wea7.data[0]["tem"] as! String)
            //                    let img = (wea7.data[0]["wea_img"] as! String) + ".png"
            //                    self.imgToday.image = UIImage(named: img)
            
            // 更新三天内的天气
            let strDays = ["今天～", "明天～", "后天～"]
            let labels = [self.labelToday, self.labelTom, self.labelAfterTom]
            let tems = [self.temToday, self.temTom, self.temAfterTom]
            let imgs = [self.imgToday, self.imgTomorrow, self.imgAfterTom]
            for index in 0..<3{
                labels[index]?.text = (strDays[index] + (wea7.data[index]["wea"] as! String))
                tems[index]?.text = ((wea7.data[index]["tem1"] as! String) + "/" + (wea7.data[index]["tem2"] as! String))
                imgs[index]?.image = UIImage(named: ((wea7.data[index]["wea_img"] as! String) + ".png"))
            }
            
            // 更新标题上的温度和天气
            self.headTem.text = (wea7.data[0]["tem"] as! String)
            self.headDesc.text = (wea7.data[0]["wea"] as! String)
            
        }, error:{error in
            
            print("请求出错了:",error.debugDescription)
            
        })
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

