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
        case audio
        case video
    }

    let state: State

    init(state: State) {
        self.state = state
    }
    
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
            
        case .audio:
            let viewModel = AudioViewModel()
            let audioVC = AudioViewController(coordinator: coordinator as? AudioCoordinator, viewModel: viewModel)
            audioVC.view.backgroundColor = .systemPink
            let audioNC = UINavigationController(rootViewController: audioVC)
            audioNC.tabBarItem = UITabBarItem(title: "Music",
                                              image: UIImage(systemName: "play"),
                                              selectedImage: UIImage(systemName: "play.fill"))
            return audioNC
            
        case .video:
            let viewModel = VideoViewModel()
            let videoVC = VideoViewController(coordinator: coordinator as? VideoCoordinator, viewModel: viewModel)
            videoVC.view.backgroundColor = .systemBlue
            let videoNC = UINavigationController(rootViewController: videoVC)
            videoNC.tabBarItem = UITabBarItem(title: "Video",
                                              image: UIImage(systemName: "tv"),
                                              selectedImage: UIImage(systemName: "tv.fill"))
            return videoNC
        }
    }
}
