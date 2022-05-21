//
//  CustomButton.swift
//  Navigation
//
//  Created by Vadim on 18.05.2022.
//

import UIKit

class CustomButton: UIButton {
    
    private var buttonAction: () -> Void
    
    init(title: String?, titleColor: UIColor?, backgroundColor: UIColor?, backgroundImage: UIImage?, buttonAction: @escaping () -> Void) {
        self.buttonAction = buttonAction
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.setBackgroundImage(backgroundImage, for: .normal)
        self.toAutoLayout()
        self.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    @objc private func buttonTapped() {
        self.buttonAction()
    }
}
