//
//  CurrentUserService.swift
//  Navigation
//
//  Created by Vadim on 08.05.2022.
//

import UIKit

protocol UserService {
    func addUser(userName: String) -> User?
}

class CurrentUserService: UserService {
    private var user = User(userName: "James", userAvatar: UIImage(named: "userAvatar")!, userStatus: "Thinking out loud")
    func addUser(userName: String) -> User? {
        if userName == user.userName {
            return user
        }
        return nil
    }
}
