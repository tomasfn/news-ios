//
//  NewsCollectionViewCell.swift
//  News
//
//  Created by Tomas Fernandez Velazco on 20/3/22.
//

import UIKit
import SDWebImage

class NewsCollectionViewCell: UICollectionViewCell, NewsListCellView {

    @IBOutlet weak var newsTitleLbl: UILabel!
    @IBOutlet weak var newsDecriptionLbl: UILabel!
    @IBOutlet weak var newsCoverImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func setupView() {
        newsTitleLbl.numberOfLines = 1
        newsDecriptionLbl.numberOfLines = 2
        newsTitleLbl.layer.cornerRadius = 16
        newsTitleLbl.clipsToBounds = true
        newsDecriptionLbl.layer.cornerRadius = 16
        newsDecriptionLbl.clipsToBounds = true
    }
    
    func displayNews(title: String, description: String, coverPhotoUrl: String) {
        newsTitleLbl.text = title
        newsDecriptionLbl.text = description
        newsCoverImageView.sd_setImage(with: URL(string: coverPhotoUrl), placeholderImage: UIImage(named: "placeholder"))
    }
}
