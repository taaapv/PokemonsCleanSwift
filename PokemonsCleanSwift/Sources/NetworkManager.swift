//
//  NetworkManager.swift
//  PokemonsCleanSwift
//
//  Created by Татьяна on 12.01.2023.
//

import Foundation

enum NetworkError {
    case invalidURL
    case noData
    case decodingError
}

enum Link: String {
    case pokemons = "https://pokeapi.co/api/v2/pokemon"
}

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    func fetch<T: Codable>(dataType: T.Type, urlString: String, completion: @escaping (T) -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No description error")
                return
            }
            
            do {
                let type = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(type)
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
