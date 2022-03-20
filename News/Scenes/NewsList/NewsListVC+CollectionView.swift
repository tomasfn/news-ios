//
//  NewsListVC+CollectionView.swift
//  News
//
//  Created by Tomas Fernandez Velazco on 20/3/22.
//

import UIKit

//MARK: CollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

extension NewsListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func setUpCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: NewsCollectionViewCell.nameOfClass, bundle: nil), forCellWithReuseIdentifier: NewsCollectionViewCell.nameOfClass)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getNewsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfItemsPerRow:CGFloat = 1
        let spacingBetweenCells:CGFloat = 2
            
        let totalSpacing = (2 * CGFloat(self.spacing)) + ((numberOfItemsPerRow - 1) * spacingBetweenCells)
        
        let width = (collectionView.bounds.width - totalSpacing)/numberOfItemsPerRow
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCollectionViewCell.nameOfClass, for: indexPath) as? NewsCollectionViewCell else { return UICollectionViewCell() }
       
        viewModel.configure(cell: cell, for: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.showDetails(index: indexPath.row)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (((collectionView.contentOffset.y + collectionView.frame.size.height) > collectionView.contentSize.height ) && !viewModel.isLoading){
            viewModel.isLoading = true
            viewModel.loadMoreItemsForList()
        }
    }
}
