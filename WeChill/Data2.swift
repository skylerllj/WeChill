//
//  Data2.swift
//  WeChill
//
//  Created by Skyler Lewis on 5/9/16.
//  Copyright © 2016 Skyler Lewis & Noah Finberg. All rights reserved.
//

import Foundation


class User: NSObject {
    
    var id: Int
    var userName: String
    var photo: String
    var age: Int
    var favoriteInterest: String
    var password: String
    var buddies: [User]
    var potentialMatches = [Buddy:Bool]()
    
    init(id: Int, userName: String, age: Int, password: String, photo: String, interest: String) {
        self.id = id
        self.userName = userName
        self.age = age
        self.password = password
        self.photo = photo
        self.favoriteInterest = interest
        self.buddies = []
    }
    
    
}

class Buddy: NSObject {
    var id: Int
    var buddy1: User
    var buddy2: User
    
    init(id: Int, buddy1: User, buddy2: User) {
        self.id = id
        self.buddy1 = buddy1
        self.buddy2 = buddy2
    }
    
}

class Data2 {
    
    var allUsers = [User]()
    
    init() {
        
        func addUser(user: User) {
            allUsers.append(user)
        }
        
        let sky = User(id: 0, userName: "sky", age: 22, password: "password", photo: "skyler", interest: "Music")
        let noah = User(id: 1, userName: "noah", age: 22, password: "password1", photo: "noah", interest: "Hiking")
        let beyonce = User(id: 2, userName: "beyonce", age: 25, password: "password", photo: "beyonce", interest: "Music")
        let selena = User(id: 3, userName: "selena", age: 24, password: "password", photo: "selena", interest: "Music")
        let mike = User(id: 4, userName: "mike", age: 26, password: "password", photo: "mike", interest: "Hiking")
        let ben = User(id: 5, userName: "ben", age: 25, password: "password", photo: "ben", interest: "Netflix and Chill")
        let amber = User(id: 6, userName: "amber", age: 23, password: "password", photo: "amber", interest: "Netflix and Chill")
        let sarah = User(id: 7, userName: "sarah", age: 24, password: "password", photo: "sarah", interest: "Fitness")
        let buddie1 = Buddy(id: 0, buddy1: sky, buddy2: noah)
        let buddie2 = Buddy(id: 1, buddy1: beyonce, buddy2: selena)
        let buddie3 = Buddy(id: 2, buddy1: mike, buddy2: ben)
        let buddie4 = Buddy(id: 3, buddy1: amber, buddy2: sarah)
        let buddie5 = Buddy(id: 4, buddy1: beyonce, buddy2: sarah)
        
        addUser(sky)
        addUser(noah)
        addUser(beyonce)
        addUser(selena)
        addUser(mike)
        addUser(ben)
        addUser(amber)
        addUser(sarah)
        
        
        sky.buddies.append(noah)
        noah.buddies.append(sky)
        beyonce.buddies.append(selena)
        selena.buddies.append(beyonce)
        mike.buddies.append(ben)
        ben.buddies.append(mike)
        amber.buddies.append(sarah)
        sarah.buddies.append(amber)
        beyonce.buddies.append(sarah)
        sarah.buddies.append(beyonce)
        
    }
    
    func checkPassword(user: String, pass: String) -> Bool {
        var loginUser: User = User(id: -1, userName: "dummy", age: 0, password: "", photo: "", interest: "")
        for users in allUsers {
            if users.userName == user {
                loginUser = users
                break;
            }
        }
        if loginUser.id != -1 && loginUser.password == pass {
            //setup NSUserDefaults (i.e. save the user's username to persist between sessions)
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setObject(loginUser.userName, forKey: "username") //puts the current user into NSUserDefaults
            return true
        } else {
            return false
        }
    }

    
}
