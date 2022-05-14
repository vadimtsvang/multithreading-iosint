//
//  LoginFactory.swift
//  Navigation
//
//  Created by Vadim on 12.05.2022.
//

import Foundation

protocol LoginFactory {
    func createLoginInspector() -> LoginInspector
}

class MyLoginFactory: LoginFactory {
    func createLoginInspector() -> LoginInspector {
        return LoginInspector()
    }
}
