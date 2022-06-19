//
//  FeedCoordinator.swift
//  Navigation
//
//  Created by Vadim on 24.05.2022.
//

import Foundation
import UIKit

final class FeedCoordinator: CoordinatorViewController {

//    func showModel(coordinator: FeedCoordinator) -> UIViewController {
//        let viewModel = FeedViewModel()
//        let profile = FeedViewController(coordinator: coordinator, viewModel: viewModel)
//        profile.title = "Feed"
//        profile.view.backgroundColor = .white
//        return profile
//    }
    var navigationController: UINavigationController?

    func Start() -> UINavigationController? {
        let factory = Factory(state: .feed)
        navigationController = factory.startModule(coordinator: self, data: nil)
        return navigationController
    }
}
