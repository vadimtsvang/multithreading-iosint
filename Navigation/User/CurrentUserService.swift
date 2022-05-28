//
//  CurrentUserService.swift
//  Navigation
//
//  Created by Vadim on 27.05.2022.
//

import Foundation
import UIKit

protocol UserServiceProtocol: AnyObject {

    func getUser(login: String) -> User?
}

final class CurrentUserService: UserServiceProtocol {

    var user = User(login: "Corgi",
                    fullName: "Corgi Dog",
                    userStatus: "Thinking Out Loud",
                    userAvatar: UIImage(named: "dog"))

    func getUser(login: String) -> User? {
        if login == user.login {
            return user
        } else {
            return nil
        }
    }
}
