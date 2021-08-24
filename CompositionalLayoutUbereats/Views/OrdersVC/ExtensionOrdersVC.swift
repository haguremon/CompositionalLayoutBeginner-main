//
//  OrdersVC.swift
//  CompositionalLayoutBeginner
//
//  Created by IwasakIYuta on 2021/08/05.
//

import Foundation
import UIKit

extension OrdersViewController: UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        orders.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: OrdersViewController.cellid2, for: indexPath) as! CollectionViewCell
        cell2.label.textColor = .black
        //cell2.backgroundColor = .systemGray
        cell2.label.textAlignment = .center
        cell2.label.numberOfLines = 0
        cell2.label.text = "\(orders[indexPath.item].shopName)\n\(orders[indexPath.item].itemCount)item\n\(orders[indexPath.item].date)*Com"
        cell2.button.backgroundColor = .systemGray
        cell2.button.tintColor = .white
        cell2.button.setTitle("test", for: .normal)
        return cell2
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("tapped\n\(orders[indexPath.item].shopName)\n\(orders[indexPath.item].itemCount)itme\n\(orders[indexPath.item].date)")
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header2 = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: OrdersViewController.headerid2, for: indexPath) as! HeaderCollectionReusableView
        header2.label.textColor = .black
        header2.label.text = "Past orders"
        return header2
    }
    
    
    
}
