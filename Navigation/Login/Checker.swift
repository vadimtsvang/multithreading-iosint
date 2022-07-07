//
//  Checker.swift
//  Navigation
//
//  Created by Vadim on 27.05.2022.
//

import Foundation
import FirebaseAuth

protocol CheckerServiceProtocol {
    func checkCredential(email: String,
                         password: String,
                         callback: @escaping (_ success: Bool) -> Void)

    func createUser(email: String,
                    password: String,
                    callback: @escaping (_ success: Bool) -> Void)
}

final class Checker: CheckerServiceProtocol {

    static let shared = Checker()

    private let auth = Auth.auth()

    func checkCredential(email: String,
                         password: String,
                         callback: @escaping (_ success: Bool) -> Void) {
        auth.signIn(withEmail: email, password: password) { result, error in
            if let user = result?.user {
                print(user.uid)
                callback(true)
            } else {
                callback(false)
            }
        }
    }

    func createUser(email: String,
                    password: String,
                    callback: @escaping (_ success: Bool) -> Void) {
        auth.createUser(withEmail: email, password: password) { result, error in
            if let user = result?.user {
                print(user.uid)
                callback(true)
            } else {
                callback(false)
            }
        }
    }
}
