//
//  MainTabBarController.swift
//  Navigation
//
//  Created by Vadim on 24.05.2022.
//

import Foundation
import UIKit

final class MainTabBarController: UITabBarController {

    private let feed = Factory(navigation: UINavigationController(), state: .feed)

    private let profile = Factory(navigation: UINavigationController(), state: .profile)

    override func viewDidLoad() {
        super.viewDidLoad()
        controllers()
    }

    func controllers() {
        viewControllers = [feed.navigation, profile.navigation]
    }
}
