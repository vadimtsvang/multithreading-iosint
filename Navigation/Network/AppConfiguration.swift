//
//  AppConfiguration.swift
//  Navigation
//
//  Created by Vadim on 19.06.2022.
//

import Foundation

enum AppConfiguration: String, CaseIterable {
    case url1 = "https://swapi.dev/api/people/8"
    case url2 = "https://swapi.dev/api/starships/3"
    case url3 = "https://swapi.dev/api/planets/5"
    
    static func randomURL() -> String {
        AppConfiguration.allCases.randomElement()?.rawValue ?? "Error"
    }
}
