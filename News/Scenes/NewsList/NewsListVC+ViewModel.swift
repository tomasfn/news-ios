//
//  NewsListVC+ViewModel.swift
//  News
//
//  Created by Tomas Fernandez Velazco on 20/3/22.
//

//MARK: - NewsListView

extension NewsListViewController: NewsListView {
    
    func showNewsDetails(viewModel: NewsDetailViewModel) {
        guard let vc = NewsDetailViewController.`init`(with: viewModel) else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func startLoading() {
        indicator.startAnimating()
        indicator.isHidden = false
    }
    
    func finishLoading() {
        indicator.stopAnimating()
        indicator.isHidden = true
    }
        
    func showError(error: String) {
        showAlertDialog(title: "Error", message: error, completion: nil)
    }
    
}
