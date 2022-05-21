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
    
    #if DEBUG
    private let loginUser = "Corgi"
    #else
    private let loginUser = "James"
    #endif
    
    private let passwordUser = "123123"
    
    private init() {}
    
    func checkLoginAndPassword(enterLogin: String, enterPassword: String) -> Bool {
        loginUser == enterLogin && passwordUser == enterPassword
    }
}

