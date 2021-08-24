//
//  ViewController.swift
//  CompositionalLayoutBeginner
//
//  Created by IwasakIYuta on 2021/08/05.
//

import UIKit

class BrowseViewController: UIViewController {
    static let headerid1 = "header1"
    static let cellid1 = "cell1"
    
    @IBOutlet weak var searchBar: UISearchBar!
    
     let categories = [
        
        "Japanese","Burgers","American","Soul Food","Latest",
        " Rewards","Top Eats","Desserts","Fast Food","Chinese"
    ]
   
    
    @IBOutlet weak var collectionView: UICollectionView!
    private let collectionViewLayout = CollectionViewLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        configuration()
        searchBarconfigur()
    }
    private func searchBarconfigur() {
        searchBar.layer.cornerRadius = 100
        searchBar.searchTextField.layer.cornerRadius = 100
        searchBar.searchTextField.frame.size.height = 60
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        collectionView.keyboardDismissMode = .onDrag
    }
    private func configuration() {
        
        collectionView.collectionViewLayout = collectionViewLayout.createBrowseLayout()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: BrowseViewController.cellid1)
        
        collectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: CollectionViewLayout.headerid1, withReuseIdentifier: BrowseViewController.headerid1)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    
    }
    
    

}
