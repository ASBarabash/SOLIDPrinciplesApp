//
//  NetworkDataFetcher.swift
//  SOLIDPrinciplesApp
//
//  Created by Alexandr Barabash on 25.05.2022.
//

import Foundation

class NetworkDataFetcher {
    
    var networkService = NetworkService()
    
    init(networkService: NetworkService = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchNewMusic(urlString: String, completion: @escaping (AppGroup?) -> Void) {
        networkService.request(urlString: urlString) { (data, error) in
            let decoder = JSONDecoder()
            guard let data = data else { return }
            let response = try? decoder.decode(AppGroup.self, from: data)
            completion(response)
        }
    }
    
    func fetchFreeGames(urlString: String, completion: @escaping (AppGroup?) -> Void) {
        networkService.request(urlString: urlString) { (data, error) in
            let decoder = JSONDecoder()
            guard let data = data else { return }
            let response = try? decoder.decode(AppGroup.self, from: data)
            completion(response)
        }
    }
    
    // декодируем полученные JSON данные в конкретную модель данных
    func fetchCountry(urlString: String, completion: @escaping ([Country]?) -> Void) {
        networkService.request(urlString: urlString) { (data, error) in
            let decoder = JSONDecoder()
            guard let data = data else { return }
            let response = try? decoder.decode([Country].self, from: data)
            completion(response)
        }
    }
    
}
