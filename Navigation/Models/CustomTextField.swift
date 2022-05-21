//
//  CustomTextField.swift
//  Navigation
//
//  Created by Vadim on 19.05.2022.
//

import UIKit

class CustomTextField: UITextField {
    
    init(font: UIFont?, textColor: UIColor?, backgroundColor: UIColor?, placeholder: String?) {
        super.init(frame: .zero)
        self.font = font
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.placeholder = placeholder
        self.autocapitalizationType = .none
        self.toAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
}
