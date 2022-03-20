//
//  NewsFactory.swift
//  News
//
//  Created by Tomas Fernandez Velazco on 19/3/22.
//

import Foundation

class NewsFactory {
    
    func getNewsList(from response: ResultResponse) -> [News] {
        let news: [News] = response.newsList
            .compactMap({ newsResponse in
                return News(author: newsResponse.author,
                            title: newsResponse.title,
                            description: newsResponse.description,
                            url: newsResponse.url,
                            urlToImage: newsResponse.urlToImage,
                            publishedAt: formattedDate(date: newsResponse.publishedAt),
                            content: newsResponse.content,
                            source: setSourceModel(sourceResponse: newsResponse.source))
            })
        
        return news
    }
    
    private func setSourceModel(sourceResponse: SourceResponse) -> Source {
        return Source(id: sourceResponse.id ?? "", name: sourceResponse.name)
    }
    
    private func formattedDate(date: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: date)
        return date ?? Date()
    }
}
