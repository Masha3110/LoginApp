//
//  User.swift
//  LoginApp
//
//  Created by SubZero on 11.04.2022.
//

struct User {
    var name: String
    var password: String
    
    static func getUserData() -> User {
        User(name: "Masha", password: "password")
    }
}
