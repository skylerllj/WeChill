//
//  SettingsViewController.swift
//  WeChill
//
//  Created by Skyler Lewis on 5/3/16.
//  Copyright © 2016 Skyler Lewis & Noah Finberg. All rights reserved.
//


import UIKit

class SettingsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ageStepper(sender: UIStepper) {
       ageLabel.text = String(Int(sender.value) + 1)
    }
    
    @IBOutlet weak var ageLabel: UILabel!
}
