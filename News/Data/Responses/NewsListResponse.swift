//
//  NewsListResponse.swift
//  News
//
//  Created by Tomas Fernandez Velazco on 19/3/22.
//


struct NewsResponse: Decodable {
    let source: SourceResponse
    let author: String
    let title: String
    let description: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    let content: String
}

struct SourceResponse: Decodable {
    let id: String
    let name: String
}

struct ResultResponse: Decodable {
    let totalResults: Int
    let status: String
    let newsList: [NewsResponse]
    
    enum CodingKeys: String, CodingKey {
        case totalResults
        case status
        case newsList = "articles"
    }
}

