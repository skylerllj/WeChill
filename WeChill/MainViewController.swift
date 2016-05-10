//
//  MainViewController.swift
//  WeChill
//
//  Created by Skyler Lewis on 5/3/16.
//  Copyright © 2016 Skyler Lewis & Noah Finberg. All rights reserved.
//

import UIKit
import CoreLocation
import AVFoundation

class MainViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    
    let data = Data2()
    var count = 0
    var oldUser = [User]()
    var matches = [User]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        noMoreMatches.hidden = true
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
            infoTop.hidden = true
            infoBottom.hidden = true
            let sad : UIImage = UIImage(named: "sadDog")!
            noMoreMatches.image = sad
            noMoreMatches.hidden = false
            self.presentViewController(displayAlert, animated: true, completion: nil)
            print("there are no more matches")
        }

        count++
        count++
        let detailsForBottom = "\(user.userName.uppercaseString) , \(user.age) , \(user.favoriteInterest)"
        let detailsForTop = "\(user.buddies[0].userName.uppercaseString) , \(user.buddies[0].age) , \(user.buddies[0].favoriteInterest)"
        infoBottom.text = detailsForBottom
        infoTop.text = detailsForTop
        
        let imageString1 = user.photo
        let imageString2 = user.buddies.first?.photo
        
        let image1 : UIImage = UIImage(named:imageString1)!
        let image2 : UIImage = UIImage(named:imageString2!)!
        
        
        let time = dispatch_time(dispatch_time_t(DISPATCH_TIME_NOW), 1 * Int64(NSEC_PER_SEC))
        dispatch_after(time, dispatch_get_main_queue()) {
            //put your code which should be executed with a delay here
            self.imageContainer.backgroundColor = UIColor.whiteColor()
            self.leftPic.image = image1
            self.rightPic.image = image2
            self.infoBottom.text = detailsForBottom
            self.infoTop.text = detailsForTop
        }
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: "chooser:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: "chooser:")
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeLeft)
        
        // Do any additional setup after loading the view, typically from a nib.
        
        //setup location manager
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self;
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
            print(locationManager.location)
            print("location services enabled")
        }
        else {
            print("location services disabled")
        }
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
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        var userLocation:CLLocation = locations[0] as! CLLocation
        let long = userLocation.coordinate.longitude
        let lat = userLocation.coordinate.latitude
    }
    
    
    
    /*var backgroundMusicPlayer = AVAudioPlayer()
    
    func playBackgroundMusic() {
        //let url = NSBundle.mainBundle().URLForResource("04 You Gots To Chill", withExtension: nil)
        let url = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("04 You Gots To Chill", ofType: "mp3")!)
        guard let newURL = url else {
            print("Could not find file!!!")
            return
        }
        do {
            backgroundMusicPlayer = try AVAudioPlayer(contentsOfURL: newURL)
            backgroundMusicPlayer.numberOfLoops = -1
            backgroundMusicPlayer.prepareToPlay()
            backgroundMusicPlayer.play()
        } catch let error as NSError {
            print(error.description)
        }
    }*/
    
    
    
    @IBOutlet weak var noMoreMatches: UIImageView!
    @IBOutlet weak var infoTop: UILabel!
    @IBOutlet weak var infoBottom: UILabel!
    @IBOutlet weak var rightPic: UIImageView!
    @IBOutlet weak var leftPic: UIImageView!
    
    
    
}

class MusicHelper {
    static let sharedHelper = MusicHelper()
    var audioPlayer: AVAudioPlayer?
    
    func playBackgroundMusic() {
        let aSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("04 You Gots To Chill", ofType: "mp3")!)
        do {
            audioPlayer = try AVAudioPlayer(contentsOfURL:aSound)
            audioPlayer!.numberOfLoops = -1
            audioPlayer!.prepareToPlay()
            audioPlayer!.play()
        } catch {
            print("Cannot play the file")
        }
    }
}

