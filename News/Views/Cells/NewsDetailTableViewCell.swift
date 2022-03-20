//
//  NewsDetailTableViewCell.swift
//  News
//
//  Created by Tomas Fernandez Velazco on 20/3/22.
//

import UIKit

class NewsDetailTableViewCell: UITableViewCell, NewsDetailCellView {

    @IBOutlet weak var infoLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func displayInfo(info: String) {
        infoLabel.text = info
    }
}
