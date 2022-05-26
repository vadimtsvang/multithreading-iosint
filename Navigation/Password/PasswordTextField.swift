//
//  PasswordTextField.swift
//  Navigation
//
//  Created by Vadim on 19.05.2022.
//

import Foundation
import UIKit

protocol PasswordTextFieldDelegate: AnyObject {
    
    func enterPassword()
}

class PasswordTextField: UITextField {

    private weak var delegatTextField: PasswordTextFieldDelegate?

    init(delegateTextField: PasswordTextFieldDelegate?) {
        self.delegatTextField = delegateTextField
        super.init(frame: .zero)
        self.toAutoLayout()
        self.textColor = .black
        self.layer.cornerRadius = 10
        self.indent(size: 10)
        self.placeholder = "Enter your word"
        self.addTarget(self, action: #selector(editWord), for: .editingChanged)
        self.text = ""
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func editWord() {
        delegatTextField?.enterPassword()
    }
}

