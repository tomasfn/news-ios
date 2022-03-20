//
//  NewsDetailViewController.swift
//  News
//
//  Created by Tomas Fernandez Velazco on 19/3/22.
//

import UIKit

class NewsDetailViewController: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var newsCoverImageView: ChachedImageView!
    @IBOutlet weak var tableView: UITableView!

    //MARK: - Properties
    
    var viewModel: NewsDetailViewModel?
        
    //MARK: - Init
    
    static func `init`(with viewModel: NewsDetailViewModel) -> NewsDetailViewController? {
        let vc = NavigationHelper.newsDetailViewController()
        vc?.viewModel = viewModel
        return vc
    }

    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let newsTitle = viewModel?.selectedNews?.title {
            title = newsTitle
        }
        
        setUpTable()
        viewModel?.setView(view: self)
        viewModel?.setNewsCoverImage()
        viewModel?.updateLoadingStatusClosure = { [weak self] () in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}
