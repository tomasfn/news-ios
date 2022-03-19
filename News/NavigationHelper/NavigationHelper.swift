//
//  File.swift
//  News
//
//  Created by Tomas Fernandez Velazco on 19/3/22.
//

import Foundation
import UIKit

class NavigationHelper {
    
    static let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)

    class func newsListViewController() -> NewsListViewController? {
        let newsListVc = mainStoryboard.instantiateViewController(withIdentifier: NewsListViewController.nameOfClass) as? NewsListViewController
        return newsListVc
    }
    
    class func newsDetailViewController() -> NewsDetailViewController? {
        let detailVc = mainStoryboard.instantiateViewController(withIdentifier: NewsDetailViewController.nameOfClass) as? NewsDetailViewController
        return detailVc
    }
}
