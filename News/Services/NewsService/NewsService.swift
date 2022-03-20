//
//  NewsService.swift
//  News
//
//  Created by Tomas Fernandez Velazco on 19/3/22.
//

import Moya

protocol NewsServiceProtocol: AnyObject {
    func retrieveNewsList(completion: @escaping ([News]?, Error?) -> Void)
}

class NewsService: NewsServiceProtocol {
        
    private let baseProvider: MoyaProvider<BaseTarget>
    private let newsFactory: NewsFactory
    private let localProvider: LocalProviderProtocol
        
    init(newsFactory: NewsFactory = NewsFactory(), baseProvider: MoyaProvider<BaseTarget> = MoyaProvider<BaseTarget>(), localProvider: LocalProviderProtocol = LocalProvider()) {
        self.newsFactory = newsFactory
        self.baseProvider = baseProvider
        self.localProvider = localProvider
    }
    
    func retrieveNewsList(completion: @escaping ([News]?, Error?) -> Void) {
        
        if let news = localProvider.getLocalNewsData() {
           completion(news, nil)
        }
        
        baseProvider.request(.retrieveNewsList) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case let .success(response):
                            
                do {
                     let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .useDefaultKeys
                    let resultResponse = try decoder.decode(ResultResponse.self, from: response.data)
                    let newsList = self.newsFactory.getNewsList(from: resultResponse)
                    self.localProvider.saveDataLocalNews(news: newsList)
                    completion(newsList, nil)
                    
                } catch let error {
                    // Status code error or Mapping Error
                    print(error)
                    completion(nil, error)
                }
     
            case let .failure(error):
                print(error.localizedDescription)
                completion(nil, error)
            }
        }
    }    
}
