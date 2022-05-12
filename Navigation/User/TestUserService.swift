//
//  TestUserService.swift
//  Navigation
//
//  Created by Vadim on 09.05.2022.
//

import Foundation
import UIKit

class TestUserService: UserService {
        private var testUser = User(userName: "User", userAvatar: (UIImage(named: "dog"))!, userStatus: "User status")
    
        func addUser(userName: String) -> User? {
//            if userName == testUser.userName {
                return testUser
//            }
//            return nil
        }
    }
