//
//  Checker.swift
//  Navigation
//
//  Created by Vadim on 12.05.2022.
//

import UIKit

class Checker {
    
    static var shared: Checker = {
        let instance = Checker()
        return instance
    }()
    
    private let loginUser = "James"
    private let passwordUser = "123123"
    
    private init() {}
    
    func checkLoginAndPassword(enterLogin: String, enterPassword: String) -> Bool {
        if loginUser == enterLogin, passwordUser == enterPassword {
            return true
        } else {
            return false
        }
    }

}
