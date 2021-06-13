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
            if self.cityFocusList[index] == cityNow{
                self.picker.selectRow(index, inComponent: 0, animated: true)
                break
            }
        }
        
        
        
        
        
        
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
