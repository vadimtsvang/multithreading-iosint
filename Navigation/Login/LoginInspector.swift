//
//  LoginInspector.swift
//  Navigation
//
//  Created by Vadim on 27.05.2022.
//

import Foundation
import FirebaseAuth

protocol LoginViewControllerDelegate: AnyObject {

    func checkCredential(email: String,
                         password: String,
                         callback: @escaping (_ success: Bool) -> Void)

    func createUser(email: String,
                    password: String,
                    callback: @escaping (_ success: Bool) -> Void)
}

class LoginInspector: LoginViewControllerDelegate {

    func checkCredential(email: String, password: String, callback: @escaping (_ success: Bool) -> Void) {
        Checker.shared.checkCredential(email: email, password: password) { success in
            if success {
                callback(true)
            } else {
                callback(false)
            }
        }
    }

    func createUser(email: String, password: String, callback: @escaping (_ success: Bool) -> Void) {
        Checker.shared.createUser(email: email, password: password) { success in
            if success {
                callback(true)
            } else {
                callback(false)
            }
        }
    }
}

