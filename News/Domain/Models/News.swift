//
//  News.swift
//  News
//
//  Created by Tomas Fernandez Velazco on 19/3/22.
//

import Foundation

struct News {
    
    let author: String
    let title: String
    let description: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    let content: String
    let source: Source
    
    init(author: String, title: String, description: String, url: String, urlToImage: String, publishedAt: String, content: String, source: Source) {
        self.author = author
        self.title = title
        self.description = description
        self.url = url
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
        self.content = content
        self.source = source
    }
}

struct Source {
    let id: String
    let name: String
}
