//
//  GeneralCoordinator.swift
//  Navigation
//
//  Created by Vadim on 24.05.2022.
//

import Foundation
import UIKit

protocol GeneralCoordinator: AnyObject {

    func startApplication() -> UIViewController
}

final class RootCoordinator: GeneralCoordinator {

    func startApplication() -> UIViewController {
        return MainTabBarController()
    }
}
