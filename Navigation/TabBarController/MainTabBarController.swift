//
//  MainTabBarController.swift
//  Navigation
//
//  Created by Vadim on 24.05.2022.
//

import Foundation
import UIKit

final class MainTabBarController: UITabBarController {
    
    var coordinator: RootCoordinator
    
    var stateAuthorization: RootCoordinator.StateAuthorization {
        didSet {
            switchStateApp()
        }
    }
    
    var userData: (userService: UserServiceProtocol,userLogin: String)?
    
    init(coordinator: RootCoordinator,
         stateAuthorization: RootCoordinator.StateAuthorization,
         userData: (userService: UserServiceProtocol, userLogin: String)?) {
        self.coordinator = coordinator
        self.stateAuthorization = stateAuthorization
        self.userData = userData
        super.init(nibName: nil, bundle: nil)
        switchStateApp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func switchStateApp() {
        switch stateAuthorization {
        case .authorized:
            guard let userData = userData else { return }
            
            let profileCoordinator = ProfileCoordinator(data: userData) {
                self.stateAuthorization = .notAuthorized
                self.userData = nil
            }
            let profileNC = try?profileCoordinator.Start()
            
            let feedCoordinator = FeedCoordinator()
            let feedNC = feedCoordinator.Start()
            
            let audioCoordinator = AudioCoordinator()
            let audioNC = audioCoordinator.Start()
            
            let videoCoordinator = VideoCoordinator()
            let videoNC = videoCoordinator.Start()
            
            guard let profileNC = profileNC, let feedNC = feedNC, let audioNC = audioNC, let videoNC = videoNC else {
                return
            }
            self.viewControllers = [profileNC, feedNC, audioNC, videoNC]
            
        case .notAuthorized:
            let loginVC = LogInViewController { userData in
                self.userData = userData
                self.stateAuthorization = .authorized
            }
            loginVC.view.backgroundColor = .white
            let loginFactory = MyLoginFactory()
            loginVC.delegate = loginFactory.factory()
            let loginNC = UINavigationController(rootViewController: loginVC)
            loginNC.navigationBar.isHidden = true
            self.viewControllers = [loginNC]
        }
    }
}
