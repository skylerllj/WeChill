//
//  ProfileViewController.swift
//  WeChill
//
//  Created by Skyler Lewis on 5/6/16.
//  Copyright © 2016 Skyler Lewis & Noah Finberg. All rights reserved.
//

import UIKit


class ProfileViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.picker.dataSource = self;
        self.picker.delegate = self;
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
    }
    
    @IBAction func ageSlider(sender: UISlider) {
        ageLabel.text = String(Int(sender.value))
    }
    
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var favoriteInterest: UILabel!
    @IBOutlet weak var picker: UIPickerView!
}

