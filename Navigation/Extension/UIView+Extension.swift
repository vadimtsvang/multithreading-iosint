//
//  UIView+Extension.swift
//  Navigation
//
//  Created by Vadim on 08.03.2022.
//

import UIKit

public extension UIView {

    func toAutoLayout() {
        translatesAutoresizingMaskIntoConstraints = false
    }

    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
}
