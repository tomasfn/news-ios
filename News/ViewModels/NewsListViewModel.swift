//
//  NewsListViewModel.swift
//  News
//
//  Created by Tomas Fernandez Velazco on 20/3/22.
//

import Foundation
import UIKit

protocol NewsListCellView {
    func displayNews(title: String, description: String, coverPhotoUrl: String)
}

protocol NewsListView: AnyObject {
    func startLoading()
    func finishLoading()
    func showNewsDetails(viewModel: NewsDetailViewModel)
    func showError(error: String)
}

class NewsListViewModel {
    
    //MARK: - Properties
    
    var reloadCollectionViewClosure: (()->())?
    var updateLoadingStatusClosure: (()->())?
    let newsService: NewsServiceProtocol
    
    private weak var view: NewsListView?

    var newsCopy: [News] = [News]()
    var news: [News] = [News]() {
        didSet {
            self.reloadCollectionViewClosure?()
        }
    }
        
    var offset : Int = 0
    var count : Int = 0
    
    var isLoading: Bool = false {
        didSet {
            self.updateLoadingStatusClosure?()
        }
    }
    
    //MARK: - Init
    
    init(newsService: NewsServiceProtocol = NewsService()) {
        self.newsService = newsService
    }
    
    //MARK: - Public methods

    func setView(view: NewsListView) {
        self.view = view
    }
    
    func fetchListData() {
        self.isLoading = true
        self.view?.startLoading()
        
        newsService.retrieveNewsList(completion: { [weak self] (news, error) in

            guard let self = self else { return }
            self.view?.finishLoading()
            
            if let error = error {
                self.view?.showError(error: error.localizedDescription)
            } else {
                guard let news = news else { return }
                self.news = self.sortedNewsList(news: news)
                self.newsCopy = self.news
                self.isLoading = false
                self.view?.finishLoading()
            }
        })
    }
    
    func loadMoreItemsForList(){
        offset += count
        fetchListData()
    }
  
    func configure(cell: NewsListCellView, for index: Int) {
        let news = news[index]
        cell.displayNews(title: news.title, description: news.description, coverPhotoUrl: news.urlToImage)
    }
    
    func filterNewsList(searchedTerm: String) {
        let filteredNews = newsCopy.filter({$0.title.contains("\(searchedTerm)")})
        if filteredNews.count > 0 {
            self.news = filteredNews
        } 
    }
    
    func showDetails(index: Int) {
        let selectedNews = news[index]
        let newsDetailViewModel = NewsDetailViewModel(selectedNews: selectedNews)
        view?.showNewsDetails(viewModel: newsDetailViewModel)
    }
        
    func getNewsCount() -> Int {
        return news.count
    }
    
    //MARK: - Private methods

    private func sortedNewsList(news: [News]) -> [News] {
        return news.sorted(by: { $0.publishedAt.compare($1.publishedAt) == .orderedDescending })
    }
}
