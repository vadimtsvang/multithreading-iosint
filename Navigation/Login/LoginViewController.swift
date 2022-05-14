//
//  LogInViewController.swift
//  Navigation
//
//  Created by Vadim on 12.03.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    var delegate: LoginViewControllerDelegate?
    let userService = CurrentUserService()
    let userServiceTest = TestUserService()
    
    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .red
        scrollView.alwaysBounceVertical = false
        return scrollView
    }()
    
    private var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private var logoImage: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "logo")
        return logo
    }()
    
    private var loginButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        button.alpha = 1.0
        
        switch button.state {
        case .selected:
            button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .selected)
            button.alpha = 0.8
            
        case .highlighted:
            button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .highlighted)
            button.alpha = 0.8
            
        case .disabled:
            button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .disabled)
            button.alpha = 0.8
        default: break
        }
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.setTitle("Log In", for: .normal)
        button.addTarget(self, action: #selector(goToPofileVC), for: .touchUpInside)
        return button
    }()
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .systemGray6
        stackView.axis = .vertical
        stackView.clipsToBounds = true
        stackView.layer.borderWidth = 0.5
        stackView.layer.cornerRadius = 10
        stackView.distribution = .fillProportionally
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        return stackView
    }()
    
    private var loginTextField: UITextField = {
        let textField = UITextField()
        textField.leftViewMode = .always
        textField.placeholder = "Email or phone"
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.autocapitalizationType = .none
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .systemGray6
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        return textField
    }()
    
    private var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.leftViewMode = .always
        textField.placeholder = "Password"
        textField.backgroundColor = .systemGray6
        textField.isSecureTextEntry = true
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.layer.borderWidth = 0.5
        textField.textColor = .black
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        return textField
    }()
    
    @objc private func hideKeyboard() {
        view.endEditing(true)
    }
    
    private func configureUI() {
        let hideKeyboard = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(hideKeyboard)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createSubviews()
        configureUI()
        
        loginTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @objc func goToPofileVC() {
        // Task 3
        //        if let userName = loginTextField.text, !userName.isEmpty {
        //            #if DEBUG
        //            if let user = userServiceTest.addUser(userName: userName) {
        //                let profileVC = ProfileViewController(userService: userServiceTest.self, userName: user.userName)
        //                navigationController?.pushViewController(profileVC, animated: true)
        //            } else {
        //                showAlert(message: "Пользователь не найден")
        //            }
        //            #else
        //            if let user = userService.addUser(userName: userName){
        //                let profileVC = ProfileViewController(userService: userService.self, userName: userName)
        //                navigationController?.pushViewController(profileVC, animated: true)
        //            } else {
        //                showAlert(message: "Пользователь не найден")
        //            }
        //            #endif
        //        } else {
        //            showAlert(message: "Ввидите имя пользователя")
        //        }
        //    }
        
        //Task 4
        
        #if DEBUG
        let userServise = TestUserService()
        #else
        let userServise = CurrentUserService()
        #endif
        
        if let login = loginTextField.text, !login.isEmpty, let password = passwordTextField.text, !password.isEmpty {
            if delegate?.checkTextFields(enterLogin: login, enterPassword: passwordTextField.text ?? "") == true {
            let profileVC = ProfileViewController(userService: userServise, userName: login)
            navigationController?.pushViewController(profileVC, animated: true)
        } else {
            showAlert(message: "Неверный логин или пароль")
        }
        } else {
            showAlert(message: "Ввидите имя пользователя и пароль")
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginTextField {
            textField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            textField.resignFirstResponder()
        }
        return true
    }
}

extension LoginViewController {
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
extension LoginViewController {
    private func createSubviews() {
        [scrollView, contentView, stackView, logoImage, loginButton, loginTextField, passwordTextField].forEach { element in
            view.addSubviews(element)
            element.toAutoLayout()
        }
        
        stackView.addArrangedSubview(loginTextField)
        stackView.addArrangedSubview(passwordTextField)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            
            logoImage.heightAnchor.constraint(equalToConstant: 100),
            logoImage.widthAnchor.constraint(equalToConstant: 100),
            logoImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            stackView.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 120),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            loginTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            loginButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            loginButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

