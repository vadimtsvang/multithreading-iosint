//
//  ProfileCoordinator.swift
//  Navigation
//
//  Created by Vadim on 24.05.2022.
//

import Foundation
import UIKit

final class ProfileCoordinator: CoordinatorViewController {
    
    var navigationController: UINavigationController?
    let userService: UserServiceProtocol?
    let userLogin: String?
    var callback: () -> Void

    init(data: (userService: UserServiceProtocol, userLogin: String), callback: @escaping () -> Void) {
        self.userService = data.userService
        self.userLogin = data.userLogin
        self.callback = callback
    }

    func Start() throws -> UINavigationController? {
        let factory = Factory(state: .profile)
        guard let userService = userService,
              let userLogin = userLogin else {
            throw AuthorizationError.badAuthData
        }
            navigationController = factory.startModule(coordinator: self, data: (userService: userService, userLogin: userLogin))
            return navigationController
    }
    
    func exitProfile() {
        callback()
    }
}
