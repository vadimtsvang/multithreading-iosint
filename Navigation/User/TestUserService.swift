//
//  TestUserService.swift
//  Navigation
//
//  Created by Vadim on 27.05.2022.
//

import Foundation
import UIKit

final class TestUserService: UserServiceProtocol {

    var user = User(login: "James",
                    fullName: "James",
                    userStatus: "My status",
                    userAvatar: UIImage(named: "userAvatar"))

    func getUser(login: String) -> User? {
        if login == user.login {
            return user
        } else {
            return nil
        }
    }
}
