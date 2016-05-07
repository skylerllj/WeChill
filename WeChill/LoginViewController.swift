//
//  ViewController.swift
//  WeChill
//
//  Created by Skyler Lewis and Noah Finberg on 4/26/16.
//  Copyright © 2016 Skyler Lewis & Noah Finberg. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    var loginData = Data()
    var mainViewController = MainViewController()
    
    let defaults = NSUserDefaults.standardUserDefaults()
    var currentUser = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func login(sender: UIButton, forEvent event: UIEvent) {
        if shouldPerformSegueWithIdentifier("toMain", sender: sender) {
            //performSegueWithIdentifier("toMain", sender: sender)
            
            //get current user from NSUserDefaults
            currentUser = defaults.stringForKey("username")!
            print(currentUser)
            
        } else {
            print("wrong")
        }
    }
    
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject!) -> Bool {
        let displayAlert = UIAlertController(title: "login error", message: "Please try again", preferredStyle: UIAlertControllerStyle.Alert )
        if (loginData.checkPassword(username.text!, pass: passwordField.text!)) {
            return true
        } else {
            displayAlert.addAction(UIAlertAction(title:"dismiss",style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(displayAlert, animated: true, completion: nil)
            return false
        }
    }
    

}

