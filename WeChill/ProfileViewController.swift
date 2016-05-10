//
//  ProfileViewController.swift
//  WeChill
//
//  Created by Skyler Lewis on 5/6/16.
//  Copyright © 2016 Skyler Lewis & Noah Finberg. All rights reserved.
//

import UIKit


class ProfileViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var data = Data2()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.picker.dataSource = self;
        self.picker.delegate = self;
        self.sliderValue.value = Float(data.currentUser.age)
        ageLabel.text = String(Int(sliderValue.value))
        favoriteInterest.text = data.currentUser.favoriteInterest
        var interest = pickerData.indexOf(data.currentUser.favoriteInterest)
        picker.selectRow(interest!, inComponent: 0, animated: true)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var pickerData = ["Hiking", "Fitness", "Food", "Music", "Netflix and Chill", "Walks on the Beach"]
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        favoriteInterest.text = pickerData[row]
        data.currentUser.favoriteInterest = pickerData[row]
        print(data.currentUser.favoriteInterest)
    }
    
    @IBAction func ageSlider(sender: UISlider) {
        ageLabel.text = String(Int(sender.value))
    }
    
    @IBOutlet weak var sliderValue: UISlider! 
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var favoriteInterest: UILabel!
    @IBOutlet weak var picker: UIPickerView!
}

