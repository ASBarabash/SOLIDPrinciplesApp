//
//  DataFetcherService.swift
//  SOLIDPrinciplesApp
//
//  Created by Alexandr Barabash on 25.05.2022.
//

import Foundation

class DataFetcherService {
    
    var networkDataFetcher: DataFetcher
    var localDataFetcher: DataFetcher
    
    init(networkDataFetcher: DataFetcher = NetworkDataFetcher(), localDataFetcher: DataFetcher = LocalDataFetcher() ) {
        self.networkDataFetcher = networkDataFetcher
        self.localDataFetcher = localDataFetcher
    }
    
    
    func fetchNewMusic(completion: @escaping (AppGroup?) -> Void) {
        let urlNewMusic = "https://rss.applemarketingtools.com/api/v2/ru/music/most-played/10/albums.json"
        networkDataFetcher.fetchGenericJSONData(urlString: urlNewMusic, response: completion)
    }
    
    func fetchFreeGames(completion: @escaping (AppGroup?) -> Void) {
        let urlFreeGames = "https://rss.applemarketingtools.com/api/v2/us/music/most-played/10/albums.json"
        networkDataFetcher.fetchGenericJSONData(urlString: urlFreeGames, response: completion)
    }
    
    func fetchCountry(completion: @escaping ([Country]?) -> Void) {
        let urlString = "https://raw.githubusercontent.com/Softex-Group/task-mobile/master/test.json"
        networkDataFetcher.fetchGenericJSONData(urlString: urlString, response: completion)
    }
    
    func fetchLocalCoutry(completion: @escaping ([Country]?) -> Void) {
        let localUrlString = "usersAPI.txt"
        localDataFetcher.fetchGenericJSONData(urlString: localUrlString, response: completion)
    }
    
}
