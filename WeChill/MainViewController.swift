//
//  MainViewController.swift
//  WeChill
//
//  Created by Skyler Lewis on 5/3/16.
//  Copyright © 2016 Skyler Lewis & Noah Finberg. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let image1 : UIImage = UIImage(named:"skyler")!
        let image2 : UIImage = UIImage(named:"noah")!
        leftPic.image = image1
        rightPic.image = image2
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var rightPic: UIImageView!
    @IBOutlet weak var leftPic: UIImageView!
    
    
    
}

