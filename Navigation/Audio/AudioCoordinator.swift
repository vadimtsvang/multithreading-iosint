//
//  AudioCoordinator.swift
//  Navigation
//
//  Created by Vadim on 05.06.2022.
//

import UIKit

final class AudioCoordinator: CoordinatorViewController {

    var navigationController: UINavigationController?

    func Start() -> UINavigationController? {
        let factory = Factory(state: .audio)
        navigationController = factory.startModule(coordinator: self, data: nil)
        
        return navigationController
    }
}
