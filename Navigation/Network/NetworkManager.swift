//
//  NetworkManager.swift
//  Navigation
//
//  Created by Vadim on 19.06.2022.
//

import Foundation

struct NetworkManager {
    
    static let shared = NetworkManager()

    func fetchData(url: String) {

        guard let url = URL(string: url) else { return }
        let request = URLRequest(url: url)
        let session = URLSession(configuration: .default)
        session.dataTask(with: request) { data, response, error in
            if let data = data,
               let response = response as? HTTPURLResponse {
                print("data: \(data) \(String(decoding: data, as: UTF8.self))")
                print("response: \(response.statusCode) \(response.allHeaderFields)")
            }
            if let error = error {
                print("error: \(error.localizedDescription)")
            }
        }.resume()
    }
}
