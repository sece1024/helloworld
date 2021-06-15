//
//  PickerViewController.swift
//  iOS-weather-hgx
//
//  Created by csq on 21/6/10.
//  Copyright © 2021年 HGX. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var picker: UIPickerView!
    var cityBl = CityBL()
    var cityFocusList: [String]!

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
        self.cityFocusList = cityBl.getAll()
        
        // 选择器
        self.picker.dataSource = self
        self.picker.delegate = self
        
        self.picker.selectedRow(inComponent: 0)
//        self.view.addSubview(picker)
        let cityNow: String = self.cityBl.getFocuedCity()
        for index in 0...(self.cityFocusList.count - 1){
            self.setBkByName(name: "bk03", type: ".jpg", alpha: 0.7)
            if self.cityFocusList[index] == cityNow{
                self.picker.selectRow(index, inComponent: 0, animated: true)
                break
            }
        }
        
        
        
        
        
        
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
    
    @IBAction func onSave(_ sender: Any) {
        let choicedCity: String = self.cityFocusList[self.picker.selectedRow(inComponent: 0)]
        print("选择的城市为: \(choicedCity)")
//        ViewController.city.nowCity = choicedCity
        self.cityBl.setFocuedCity(name: choicedCity)
        self.performSegue(withIdentifier: "FromCityChoiceToHome", sender: nil)
    }
    @IBAction func onCancel(_ sender: Any) {
        self.performSegue(withIdentifier: "FromCityChoiceToHome", sender: nil)
    }
    
    //设置选择框个选项的内容
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.cityFocusList[row]
    }
    
    // 选择框的列数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // 选择框的行数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.cityFocusList.count
    }
   
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
