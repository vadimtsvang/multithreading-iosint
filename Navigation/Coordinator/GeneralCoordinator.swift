//
//  GeneralCoordinator.swift
//  Navigation
//
//  Created by Vadim on 24.05.2022.
//

import Foundation
import UIKit

protocol GeneralCoordinator: AnyObject {

    func startApplication(userData: (userService: UserServiceProtocol, userLogin: String)?) -> UIViewController
}

protocol CoordinatorViewController: AnyObject {
    var navigationController: UINavigationController? { get set }
    func Start() throws -> UINavigationController?
}

final class RootCoordinator: GeneralCoordinator {
    enum StateAuthorization {
        case authorized
        case notAuthorized
    }

    func startApplication(userData: (userService: UserServiceProtocol, userLogin: String)?) -> UIViewController {
        let tabBarcontroller = MainTabBarController(coordinator: self, stateAuthorization: .notAuthorized, userData: userData)
            return tabBarcontroller
        }
}
