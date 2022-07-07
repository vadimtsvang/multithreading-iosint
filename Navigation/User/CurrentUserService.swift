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
    
    private let user: User
    
    init(login: String, userStatus: String, userAvatar: String) {
        self.user = User(login: login, userStatus: userStatus, userAvatar: UIImage(named: userAvatar))
    }
    
    func getUser(login: String) -> User? {
        if login == user.login {
            return user
        } else {
            return nil
        }
    }
}
