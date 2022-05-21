//
//  CheckWord.swift
//  Navigation
//
//  Created by Vadim on 19.05.2022.
//

import Foundation

class CheckWord {
    
    private let word = "Пароль"
    
    func checkingWord(enterWord: String?, onChecked: (Bool) -> Void) -> Void {
        onChecked(enterWord == word)
    }
}
