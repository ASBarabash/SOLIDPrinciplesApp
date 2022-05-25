//
//  DataFetcherService.swift
//  SOLIDPrinciplesApp
//
//  Created by Alexandr Barabash on 25.05.2022.
//

import Foundation

class DataFetcherService {
    
    var dataFetcher: DataFetcher
    
    init(dataFetcher: DataFetcher = NetworkDataFetcher()) {
        self.dataFetcher = dataFetcher
    }
    
    
    func fetchNewMusic(completion: @escaping (AppGroup?) -> Void) {
        let urlNewMusic = "https://rss.applemarketingtools.com/api/v2/ru/music/most-played/10/albums.json"
        dataFetcher.fetchGenericJSONData(urlString: urlNewMusic, response: completion)
    }
    
    func fetchFreeGames(completion: @escaping (AppGroup?) -> Void) {
        let urlFreeGames = "https://rss.applemarketingtools.com/api/v2/us/music/most-played/10/albums.json"
        dataFetcher.fetchGenericJSONData(urlString: urlFreeGames, response: completion)
    }
    
    func fetchCountry(completion: @escaping ([Country]?) -> Void) {
        let urlString = "https://raw.githubusercontent.com/Softex-Group/task-mobile/master/test.json"
        dataFetcher.fetchGenericJSONData(urlString: urlString, response: completion)
        
        
    }
    
}
