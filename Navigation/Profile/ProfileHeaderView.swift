//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Vadim on 08.03.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "dog")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        imageView.layer.cornerRadius = 55
        return imageView
    }()

// Task 6
//    private lazy var setStatusButton: UIButton = {
//        let button = UIButton()
//        button.backgroundColor = .systemBlue
//        button.setTitle("My status", for: .normal)
//        button.layer.cornerRadius = 4
//        button.layer.shadowColor = UIColor.black.cgColor
//        button.layer.shadowOffset = CGSize(width: 4, height: 4)
//        button.layer.shadowOpacity = 0.7
//        button.layer.shadowRadius = 10
//        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
//        return button
//    }()
    
    private lazy var setStatusButton: CustomButton = {
        let button = CustomButton(title: "My Title", titleColor: .white, backgroundColor: nil, backgroundImage: UIImage(imageLiteralResourceName: "blue_pixel"), buttonAction: { [weak self] in
            if ((self?.statusText.isEmpty) != nil) {
                self?.statusText = "Set status"
            }
            self?.statusLabel.text = self?.statusText
            self?.endEditing(true)
        })
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        return button
    }()
    
    lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Hipster Dog"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Waiting for something..."
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.black.cgColor
        textField.placeholder = "  Input Text"
        return textField
    }()
        
    private var statusText = String()
    
    let animationView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0
        view.toAutoLayout()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubviews()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        statusTextField.delegate = self

    }
    
    private func createSubviews() {
        [avatarImageView, setStatusButton, statusLabel, fullNameLabel, statusTextField].forEach { element in
            addSubview(element)
            element.toAutoLayout()
        }
        
        NSLayoutConstraint.activate([
            
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            
            fullNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            fullNameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor, constant: 11),
            
            statusLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            statusLabel.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: -25),
            
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 10),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.leadingAnchor.constraint(equalTo: statusLabel.leadingAnchor),
            statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            setStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 24),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
    
//    @objc func buttonClicked() {
//        print(statusTextField.text ?? "No text")
//    }
}

extension ProfileHeaderView : UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if statusTextField.text == "Waiting for something..." {
            statusTextField.text = nil
            statusTextField.textColor = .black
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = statusTextField.text, text.isEmpty {
            statusTextField.text = "Waiting for something..."
            statusTextField.textColor = .gray
            statusLabel.text = "Set up status"
        }
    }
   func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       statusTextField.resignFirstResponder()
       return true
   }
}

