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
        

        addLogin("sky",passWord: "password")
        addLogin("noah", passWord: "password1")
        addIndividualPics("noah", pictureString: "NoahF.jpg")
        addIndividualPics("sky", pictureString: "Ebony Ball B&W copy.jpg")
        
    }
    
    func checkPassword(user: String, pass: String) -> Bool {
        if login.indexForKey(user) != nil && login[user] == pass {
            return true
        } else {
            return false
        }
    }
    
}