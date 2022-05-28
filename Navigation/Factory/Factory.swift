//
//  Factory.swift
//  Navigation
//
//  Created by Vadim on 12.05.2022.
//

import Foundation
import UIKit

final class Factory {

    enum State {
        case profile
        case feed
    }

    let state: State
    //let navigation: UINavigationController

    init(state: State) {
        self.state = state
        //self.navigation = navigation
        //startModule()
    }

//    func startModule() {
//        switch state {
//        case .profile:
//            let coordinator = LoginCoordinator()
//            let controller = coordinator.showModel(coordinator: coordinator)
//            navigation.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle"), selectedImage: UIImage(systemName: "person.crop.circle.fill"))
//            navigation.setViewControllers([controller], animated: false)
//
//            ()
//        case .feed:
//            let coordinator = FeedCoordinator()
//            let controller = coordinator.showModel(coordinator: coordinator)
//            navigation.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "note.text"), tag: 0)
//            navigation.setViewControllers([controller], animated: false)
//        }
//    }
    
    func startModule(coordinator: CoordinatorViewController, data: (userService: UserServiceProtocol, userLogin: String)?) -> UINavigationController? {
        switch state {
        case .profile:
            guard let userDate = data else { return nil }
            let profileViewModel = ProfileViewModel()
            let profileVC = ProfileViewController(coordinator: coordinator as? ProfileCoordinator, viewModel: profileViewModel, userService: userDate.userService, userLogin: userDate.userLogin)
            let profileNC = UINavigationController(rootViewController: profileVC)
            profileNC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle"), selectedImage: UIImage(systemName: "person.crop.circle.fill"))
            return profileNC

        case .feed:
            let feedViewModel = FeedViewModel()
            let feedVC = FeedViewController(coordinator: coordinator as? FeedCoordinator, viewModel: feedViewModel)
            feedVC.view.backgroundColor = .white
            let feedNC = UINavigationController(rootViewController: feedVC)
            feedNC.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "note.text"), tag: 0)
            return feedNC
        }
    }
}
