//
//  User.swift
//  Navigation
//
//  Created by Vadim on 08.05.2022.
//

import UIKit

struct User {
    let userName: String
    let userAvatar: UIImage
    let userStatus: String
    
    public init(userName: String, userAvatar: UIImage, userStatus: String) {
        self.userName = userName
        self.userAvatar = userAvatar
        self.userStatus = userStatus
    }
}
