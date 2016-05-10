//
//  MainViewController.swift
//  WeChill
//
//  Created by Skyler Lewis on 5/3/16.
//  Copyright © 2016 Skyler Lewis & Noah Finberg. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let data = Data2()
    var count = 0
    var oldUser = [User]()
    var matches = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let displayAlert = UIAlertController(title: "No more matches", message: "Please check back later", preferredStyle: UIAlertControllerStyle.Alert )
        displayAlert.addAction(UIAlertAction(title:"dismiss",style: UIAlertActionStyle.Default, handler: nil))
        var user = data.allUsers[0]
        user = data.allUsers[0]
        if data.allUsers.count > count {
            user = data.allUsers[count]
            if oldUser.contains(user) {
                viewDidLoad()
            } else {
                oldUser.append(user)
            }
            
        } else {
            rightPic.hidden = true
            leftPic.hidden = true
            self.presentViewController(displayAlert, animated: true, completion: nil)
            print("there are no more matches")
        }

        count++
        count++
        var imageString1 = user.photo
        var imageString2 = user.buddies.first?.photo
        
        let image1 : UIImage = UIImage(named:imageString1)!
        let image2 : UIImage = UIImage(named:imageString2!)!
        
        
        let time = dispatch_time(dispatch_time_t(DISPATCH_TIME_NOW), 1 * Int64(NSEC_PER_SEC))
        dispatch_after(time, dispatch_get_main_queue()) {
            //put your code which should be executed with a delay here
            self.imageContainer.backgroundColor = UIColor.whiteColor()
            self.leftPic.image = image1
            self.rightPic.image = image2
        }
        
        var swipeRight = UISwipeGestureRecognizer(target: self, action: "chooser:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
        
        var swipeLeft = UISwipeGestureRecognizer(target: self, action: "chooser:")
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeLeft)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var imageContainer: UIView!
    
    @IBAction func chooser(sender: UISwipeGestureRecognizer) {
        let displayAlert = UIAlertController(title: "It's a match!!", message: "Chill Soon", preferredStyle: UIAlertControllerStyle.Alert )
        displayAlert.addAction(UIAlertAction(title:"dismiss",style: UIAlertActionStyle.Default, handler: nil))
        
        if let swipeGesture = sender as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Right: // You like them
                imageContainer.backgroundColor = UIColor.greenColor()
                data.allUsers[0].potentialMatches[(oldUser.last)!] = true // set the like value to true
                if oldUser.last?.potentialMatches[data.allUsers[0]] == true {
                    self.presentViewController(displayAlert, animated: true, completion: nil)
                    
                    matches.append(oldUser.last!) // This will hold one of the users in the match which will populate their buddies
                }
                print("Swiped right")
                viewDidLoad()
                break
            case UISwipeGestureRecognizerDirection.Left: // Meh
                imageContainer.backgroundColor = UIColor.redColor()
                data.allUsers[0].potentialMatches[(oldUser.last)!] = false
                print("Swiped left")
                viewDidLoad()
                break
            default:
                break
            }
        }
        
        
    }
    @IBOutlet weak var rightPic: UIImageView!
    @IBOutlet weak var leftPic: UIImageView!
    
    
    
}

