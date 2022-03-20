//
//  NewsListVC+SearchController.swift
//  News
//
//  Created by Tomas Fernandez Velazco on 20/3/22.
//

import UIKit

//MARK: - UISearchController

extension NewsListViewController: UISearchControllerDelegate, UISearchResultsUpdating {
    
    func setUpSearchController() {
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Search news"
        navigationItem.searchController = search
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let textSearched = searchController.searchBar.text else { return }
        viewModel.filterNewsList(searchedTerm: textSearched)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        viewModel.fetchListData()
    }
}
