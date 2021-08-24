//
//  ExtensionHomeVC.swift
//  CompositionalLayoutUbereats
//
//  Created by IwasakIYuta on 2021/08/07.
//

import Foundation
import UIKit


extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        10
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return categories.count
        case 3:
            return 5
        case 5:
            return 7
        case 6:
            return 6
        case 7:
            return categories.count
        default:
            return 1
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeViewController.cellid, for: indexPath) as! CollectionViewCell
        cell.backgroundColor = .systemGray
        cell.label.textAlignment = .center
        switch indexPath.section {
        case 0:
            cell.label.text = categories[indexPath.row]
            cell.layer.cornerRadius = 0
            return cell
        case 3:
            cell.layer.cornerRadius = 10
            cell.label.text = ""
            return cell
        case 7:
            cell.layer.cornerRadius = 10
            cell.label.text = categories[indexPath.row]
            return cell
        default:
            cell.label.text = ""
            cell.layer.cornerRadius = 1
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HomeViewController.headerid, for: indexPath) as! HeaderCollectionReusableView
        if indexPath.section == 5 {
            header.label.font = .boldSystemFont(ofSize: 30)
            header.label.text = " In a rush?"
        }
        return header
    }
}
