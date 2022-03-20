//
//  NewsListViewController.swift
//  News
//
//  Created by Tomas Fernandez Velazco on 18/3/22.
//

import UIKit

class NewsListViewController: UIViewController {
    
    //MARK: - IBOutlets

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    //MARK: - Properties
    
    let search = UISearchController(searchResultsController: nil)
    
    let spacing: Float = 16.0

    lazy var viewModel: NewsListViewModel = {
          return NewsListViewModel()
    }()

    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "News"
        
        initViewModel()
        setUpCollectionView()
        setUpSearchController()
    }
    
    //MARK: - Public methods

    func initViewModel() {
        viewModel.setView(view: self)
        viewModel.reloadCollectionViewClosure = { [weak self] () in
           DispatchQueue.main.async {
              self?.collectionView.reloadData()
           }
        }
    }
}

