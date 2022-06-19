//
//  LoginInspector.swift
//  Navigation
//
//  Created by Vadim on 27.05.2022.
//

import Foundation
protocol LoginViewControllerDelegate {

    func check(login: String, password: String) -> Bool
}

struct LoginInspector: LoginViewControllerDelegate {

    func check(login: String, password: String) -> Bool {
        let isRight = Checker.shared.check(login: login, password: password)
        if isRight {
            return true
        } else {
            return false
        }
    }
}
