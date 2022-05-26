//
//  InfoViewModel.swift
//  Navigation
//
//  Created by Vadim on 24.05.2022.
//

import Foundation
import UIKit

final class InfoViewModel {

    var alert: UIAlertController {
        let alert = UIAlertController(title: "Mistake", message: "Are you sure?", preferredStyle: .alert)

        let yes = UIAlertAction(title: "Yeap", style: .default) { _ in
            print("Yes")
        }
        let no = UIAlertAction(title: "Nope", style: .cancel) { _ in
            print("No")
        }

        alert.addAction(yes)
        alert.addAction(no)

        return alert
    }

    func presentAlert(controller: UIViewController) {
        controller.present(alert, animated: true)
    }

    func setupConstraints(controller: UIViewController, button: UIButton) {
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: controller.view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: controller.view.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalTo: controller.view.safeAreaLayoutGuide.widthAnchor, constant: -32)
        ])
    }
}
