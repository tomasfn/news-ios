//
//  BaseTarget.swift
//  News
//
//  Created by Tomas Fernandez Velazco on 19/3/22.
//

import Foundation
import Moya

enum BaseTarget {
    case retrieveNewsList
}

extension BaseTarget: TargetType {
        
    var baseURL: URL {
        return URL(string: SharedInfo.baseUrl)!
    }
    
    var path: String {
        switch self {
        case .retrieveNewsList:
            return "/v2/everything?"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .retrieveNewsList:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .retrieveNewsList:
            return .requestParameters(parameters: [ "apikey": SharedInfo.publicApiKey, "language": CountryLanguage.es, "q": SearchContent.android], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return [
            "Accept" : "application/json",
            "Content-Type" : "application/json"
        ]
    }
    
    var validationType: ValidationType {
        return .successCodes
    }
}
