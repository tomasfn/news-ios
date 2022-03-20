//
//  NewsDetail+ViewModel.swift
//  News
//
//  Created by Tomas Fernandez Velazco on 20/3/22.
//

import Foundation
import SDWebImage

//MARK: - NewsDetailView

extension NewsDetailViewController: NewsDetailView {
    
    func setCoverImage(coverUrl: String) {
        newsCoverImageView.sd_setImage(with: URL(string: coverUrl), placeholderImage: UIImage(named: "placeholder"))
    }
}
