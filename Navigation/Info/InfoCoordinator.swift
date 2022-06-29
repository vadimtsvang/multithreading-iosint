//
//  InfoCoordinator.swift
//  Navigation
//
//  Created by Vadim on 24.05.2022.
//

import Foundation
import UIKit

final class InfoCoordinator {

    func push(controller: UINavigationController?, coordinator: InfoCoordinator) {
        let viewModel = InfoViewModel()
        let viewController = InfoViewController(coordinator: coordinator, viewModel: viewModel)
        viewController.view.backgroundColor = .purple
        controller?.present(viewController, animated: true)
    }
}
