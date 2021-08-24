//
//  extensionTab1.swift
//  CompositionalLayoutBeginner
//
//  Created by IwasakIYuta on 2021/08/05.
//

import Foundation
import UIKit

extension BrowseViewController : UICollectionViewDataSource , UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: BrowseViewController.cellid1, for: indexPath) as! CollectionViewCell
        cell1.backgroundColor = .systemGray
        cell1.label.textAlignment = .center
        cell1.label.textColor = .white
        cell1.label.text = categories[indexPath.item]
        return cell1
    }
    
    //viewForSupplementaryをつけることができるヘッダーやフッターなので
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header1 = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                      withReuseIdentifier: BrowseViewController.headerid1,
                                                                      for: indexPath) as! HeaderCollectionReusableView
        if indexPath.section == 0 {
        
            header1.label.text = "Top categories"
        
        } else {
            
            header1.label.text = "More categories"
        
        }
        
        return header1
    }
    
    
    
}


