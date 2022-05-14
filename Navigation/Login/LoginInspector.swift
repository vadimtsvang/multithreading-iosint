//
//  LoginInspector.swift
//  Navigation
//
//  Created by Vadim on 12.05.2022.
//

import Foundation

class LoginInspector: LoginViewControllerDelegate {
    func checkTextFields(enterLogin: String, enterPassword: String) -> Bool {
        return Checker.shared.checkLoginAndPassword(enterLogin: enterLogin, enterPassword: enterPassword)
    }
}
