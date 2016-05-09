//
//  Data.swift
//  WeChill
//
//  Created by Skyler Lewis on 5/6/16.
//  Copyright © 2016 Skyler Lewis & Noah Finberg. All rights reserved.
//

import Foundation

class Data {

    var login = [String:String]() // username / password
    var individualPics = [String:String]() // username associated with picture
    var buddies = [String:String]() // buddy1 matched with buddy2
    var potentialMatches = [String:Bool]() // holds one buddy pair match to another
    var actualMatches = [String:String]() // holds the actual matches
    
    
    init() {
        func addLogin(userName: String, passWord: String) {
            login[userName] = passWord
        }
        func addIndividualPics(userName:String, pictureString: String) {
            individualPics[userName] = pictureString
        }
        func addBuddies(firstBuddy: String, secondBuddy: String) {
            buddies[firstBuddy] = secondBuddy
        }
        func addPotentialMatches(buddies1: (String,String), buddies2:(String,String), like:Bool) {
            
        }
        func addActualMatches(buddies1: (String,String), buddies2: (String,String)) {
    
        }
        

        addLogin("sky",passWord: "password")
        addLogin("noah", passWord: "password1")
        addIndividualPics("noah", pictureString: "NoahF.jpg")
        addIndividualPics("sky", pictureString: "Ebony Ball B&W copy.jpg")
        addBuddies("sky",secondBuddy: "noah")
        addBuddies("beyonce", secondBuddy: "selena")
        addBuddies("ben", secondBuddy: "mike")
        print(buddies)
        
    }
    
    func checkPassword(user: String, pass: String) -> Bool {
        if login.indexForKey(user) != nil && login[user] == pass {
            //setup NSUserDefaults (i.e. save the user's username to persist between sessions)
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setObject(user, forKey: "username") //puts the current user into NSUserDefaults
            return true
        } else {
            return false
        }
    }
    
}