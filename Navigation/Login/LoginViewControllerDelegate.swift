//
//  LoginViewControllerDelegate.swift
//  Navigation
//
//  Created by Vadim on 12.05.2022.
//

import Foundation

protocol LoginViewControllerDelegate: AnyObject {
    func checkTextFields(enterLogin: String, enterPassword: String) -> Bool
}
