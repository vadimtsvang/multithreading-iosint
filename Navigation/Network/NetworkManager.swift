//
//  NetworkManager.swift
//  Navigation
//
//  Created by Vadim on 19.06.2022.
//

import Foundation

struct NetworkManager {
    
    static let shared = NetworkManager()
    
    static private(set) var title: String = ""
    static private(set) var planetData = ""
    static private(set) var planetName = ""
    
    func dataTitle() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos/2") else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url ) { data, response, error in
            if let error = error {
                print("Error \(error.localizedDescription)")
                return
            }
            
            guard let data = data else { return }
            do {
                let serializedDictionary = try JSONSerialization.jsonObject(with: data, options: [])
                guard let dictionary = serializedDictionary as? [String : Any] else { return }
                guard let title = dictionary["title"] as? String else { return }
                NetworkManager.title = title
            } catch {
                print("Error \(error.localizedDescription)")
            }
        }
        task.resume()
    }
            
    func dataPlanet() {
        guard let url = URL(string: "https://swapi.dev/api/planets/1") else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let data = data else { return }
            let decoder = JSONDecoder()
            do {
                let dataJSON = try decoder.decode(Planet.self, from: data)
                NetworkManager.planetData = dataJSON.orbitalPeriod
                NetworkManager.planetName = dataJSON.name
            } catch {
                print("Error \(error.localizedDescription)")
            }
        }
        task.resume()
    }
}
