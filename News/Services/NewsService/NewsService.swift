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
        
    init(newsFactory: NewsFactory = NewsFactory(), baseProvider: MoyaProvider<BaseTarget> = MoyaProvider<BaseTarget>()) {
        self.newsFactory = newsFactory
        self.baseProvider = baseProvider
    }
    
    func retrieveNewsList(completion: @escaping ([News]?, Error?) -> Void) {
        baseProvider.request(.retrieveNewsList) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case let .success(response):
                            
                do {
                     let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .useDefaultKeys
                    let resultResponse = try decoder.decode(ResultResponse.self, from: response.data)
                    let newsList = self.newsFactory.getNewsList(from: resultResponse)
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
