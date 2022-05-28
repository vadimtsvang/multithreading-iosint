//
//  Checker.swift
//  Navigation
//
//  Created by Vadim on 27.05.2022.
//

import Foundation

final class Checker {

    static let shared = Checker()

    private let login = "Corgi"

    private let password = "123123"

    func check(login: String, password: String) -> Bool {
        if login.hash == self.login.hash && password.hash == self.password.hash {
            return true
        } else {
            return false
        }
    }
}
