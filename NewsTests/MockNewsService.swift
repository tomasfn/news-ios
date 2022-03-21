//
//  MockNewsService.swift
//  NewsTests
//
//  Created by Tomas Fernandez Velazco on 20/3/22.
//

@testable import News

final class MockNewsService: NewsServiceProtocol {
    
    var isSearchingNewsFromApi = false
    var completeClosure: (([News]?, Error?) -> ())!
    
    func retrieveNewsList(completion: @escaping ([News]?, Error?) -> Void) {
        isSearchingNewsFromApi = true
        completeClosure = completion
    }
}
