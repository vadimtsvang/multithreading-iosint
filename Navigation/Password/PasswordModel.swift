//
//  PasswordModel.swift
//  Navigation
//
//  Created by Vadim on 19.05.2022.
//

import Foundation

struct Password {

    static let shared = Password()

    private let password = "123123"

    func check(_ word: String) {

        if word != password {
            NotificationCenter.default.post(name: Notification.Name("false"), object: nil)
        } else {
            NotificationCenter.default.post(name: Notification.Name("true"), object: nil)
        }
    }
}
