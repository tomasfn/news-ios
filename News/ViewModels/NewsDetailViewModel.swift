//
//  NewsDetailViewModel.swift
//  News
//
//  Created by Tomas Fernandez Velazco on 20/3/22.
//

import Foundation

protocol NewsDetailCellView {
    func displayInfo(info: String)
}

protocol NewsDetailView: AnyObject {
    func setCoverImage(coverUrl: String)
}

class NewsDetailViewModel {
    
    //MARK: - Properties
    
    private weak var view: NewsDetailView?
    var selectedNews: News?
    var updateLoadingStatusClosure: (()->())?
    
    //MARK: - Init

    init(selectedNews: News) {
        self.selectedNews = selectedNews
    }
    
    func setView(view: NewsDetailView) {
        self.view = view
    }
    
    //MARK: - Public methods

    func configure(cell: NewsDetailCellView, for index: Int) {
        let info = populateTableViewDetail()[index]
        cell.displayInfo(info: info)
    }
    
    func setNewsCoverImage() {
        view?.setCoverImage(coverUrl: getImageUrl())
    }
    
    func populateTableViewDetail() -> [String] {
        
        var values: [String] = [String]()
        
        values = [
            getTitle(),
            getAuthor(),
            getDateWasPublished() ?? "",
            getDescription()
        ]
        
        return values
    }
    
    //MARK: - Private Methods
        
    private func getAuthor() -> String {
        let author = selectedNews?.author ?? ""
        return "Autor: " + author
    }
    
    private func getTitle() -> String {
        return selectedNews?.title ?? ""
    }
    
    func getDescription() -> String {
        return selectedNews?.description ?? ""
    }
    
    private func getUrlOfNews() -> String {
        return selectedNews?.url ?? ""
    }
    
    private func getImageUrl() -> String {
        return selectedNews?.urlToImage ?? ""
    }
    
    func getContent() -> String {
        return selectedNews?.content ?? ""
    }
    
    private func getSource() -> Source? {
        return selectedNews?.source
    }
    
    private func getDateWasPublished() -> String? {
        var date = "Fecha: "
        if let publishedAt = selectedNews?.publishedAt {
            date.append(formatDate(date: publishedAt))
        }
        return date
    }
    
    func formatDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        let str = dateFormatter.string(from: date)
        return str
    }
}

