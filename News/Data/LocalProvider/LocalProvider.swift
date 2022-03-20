//
//  LocalProvider.swift
//  News
//
//  Created by Tomas Fernandez Velazco on 20/3/22.
//

import Foundation

protocol LocalProviderProtocol {
    func saveDataLocalNews(news: [News])
    func getLocalNewsData() -> [News]?
    func removeLocalNewsData()
}

class LocalProvider: LocalProviderProtocol {
 
    func removeLocalNewsData() {
        UserDefaults.standard.removeObject(forKey: "news")
    }
    
    func saveDataLocalNews(news: [News]) {
        if let data = try? JSONEncoder().encode(news) {
            UserDefaults.standard.set(data, forKey: "news")
        }
    }
    
    func getLocalNewsData() -> [News]? {
        if let data = UserDefaults.standard.value(forKey: "news") as? Data, let news = try? JSONDecoder().decode([News].self, from: data) {
            return news
        } else {
            return []
        }
    }
}
