//
//  LoginFactory.swift
//  Navigation
//
//  Created by Vadim on 27.05.2022.
//

import Foundation

protocol LoginFactory {

    func factory() -> LoginInspector
}

struct MyLoginFactory: LoginFactory {

    func factory() -> LoginInspector {
        return LoginInspector()
    }
}
