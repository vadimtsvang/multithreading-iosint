//
//  InfoViewController.swift
//  Navigation
//
//  Created by Vadim on 25.02.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    private let coordinator: InfoCoordinator?
    private let viewModel: InfoViewModel?
    
    lazy var buttonAlert: ButtonAlert = {
        let button = ButtonAlert(title: "Info", titleColor: .yellow) { [ weak self ] in
            guard let self = self else { return }
            self.pressButton()
        }
        return button
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25, weight: .regular)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    lazy var planetLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25, weight: .regular)
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    init(coordinator: InfoCoordinator?, viewModel: InfoViewModel) {
        self.coordinator = coordinator
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        viewModel?.setupConstraints(controller: self, button: buttonAlert)
    }
    
    func setupConstraints() {
        view.addSubviews(titleLabel, planetLabel, buttonAlert)
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            
            planetLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            planetLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            planetLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
        titleLabel.text = NetworkManager.title
        planetLabel.text = "Период вращения \(NetworkManager.planetName) вокруг своей звезды - \(NetworkManager.planetData) дня"
    }
    
        func pressButton() {
            viewModel?.presentAlert(controller: self)
        }
}
