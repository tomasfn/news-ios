//
//  NewsListViewModelTests.swift
//  NewsTests
//
//  Created by Tomas Fernandez Velazco on 20/3/22.
//

import XCTest
@testable import News

class NewsListViewModelTests: XCTestCase {
    
    var newsListViewModel: NewsListViewModel!
    var mockNewsService: MockNewsService!

    override func setUp() {
        super.setUp()

        mockNewsService = MockNewsService()
        newsListViewModel = .init(newsService: mockNewsService)
    }
    
    override func tearDown() {
        newsListViewModel = nil
        mockNewsService = nil
        
        super.tearDown()
    }
    
    func test_newsRecievedWithSuccess() {
        newsListViewModel.fetchListData()
                
        XCTAssertNotNil(newsListViewModel.news)
    }
}
