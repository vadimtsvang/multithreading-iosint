//
//  FeedViewController.swift
//  Navigation
//
//  Created by Vadim on 31.01.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    private let post = Post(title: "Selected post")
    private let checkWord: CheckWord?
    
    //    func makeNextButton() {
    //        let button = UIButton(frame: CGRect(x: 100, y: 300, width: 200, height: 50))
    //        button.setTitle("Next", for: .normal)
    //        view.addSubview(button)
    //        button.addTarget(self, action: #selector(nextTap), for: .touchUpInside)
    //    }
    //
    //    @objc func nextTap() {
    //        let vc = PostViewController()
    //        navigationController?.pushViewController(vc, animated: true)
    //    }
    
    // Task 6
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.toAutoLayout()
        return stackView
    }()
    
    private lazy var buttonCheck: CustomButton = {
        let button = CustomButton(title: "Check your word", titleColor: .white, backgroundColor: nil, backgroundImage: UIImage(imageLiteralResourceName: "blue_pixel"), buttonAction: { [weak self] in
            self?.label.isHidden = false
            self?.checkWord?.checkingWord(enterWord: self?.textField.text, onChecked: { correct in
                if (correct) {
                    self?.label.text = "Yeap"
                    self?.label.textColor = .green
                } else {
                    self?.label.text = "Nope"
                    self?.label.textColor = .systemRed
                }
            })
        })
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        return button
    }()
    
    private lazy var textField: CustomTextField = {
        let textField = CustomTextField(font: .systemFont(ofSize: 16), textColor: .black, backgroundColor: .systemGray6, placeholder: "Enter your text")
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.toAutoLayout()
        return textField
    }()
    
    private lazy var label : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        label.isHidden = true
        label.toAutoLayout()
        return label
    }()
    
    init() {
        self.checkWord = CheckWord()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createSubviews()
        setupConstraints()
    }
}

extension FeedViewController {
    private func createSubviews() {
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(textField)
        stackView.addArrangedSubview(buttonCheck)
    }
    
    private func setupConstraints() {
        [
            stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            label.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            
            textField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            textField.heightAnchor.constraint(equalToConstant: 50),
            textField.widthAnchor.constraint(equalToConstant: 300),
            
            buttonCheck.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            buttonCheck.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            buttonCheck.heightAnchor.constraint(equalToConstant: 50),
            buttonCheck.widthAnchor.constraint(equalToConstant: 300),
        ]
        .forEach {$0.isActive = true}
    }
}

