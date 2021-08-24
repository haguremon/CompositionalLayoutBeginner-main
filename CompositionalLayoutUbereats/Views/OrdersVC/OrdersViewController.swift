//
//  Tab2ViewController.swift
//  CompositionalLayoutBeginner
//
//  Created by IwasakIYuta on 2021/08/05.
//

import UIKit

class OrdersViewController: UIViewController {
    static let cellid2 = "cell2"
    static let headerid2 = "header2"
    
     var orders: [Order] = [
        Order(shopName: "aaaaa", itemCount: 1, date: Date()),
        Order(shopName: "bbbbb", itemCount: 2, date: Date()),
        Order(shopName: "ccccc", itemCount: 3, date: Date()),
        Order(shopName: "ddddd", itemCount: 4, date: Date()),
        Order(shopName: "eeeee", itemCount: 5, date: Date()),
        Order(shopName: "fffff", itemCount: 6, date: Date())
    ]
    
   
    @IBOutlet weak var collectionView: UICollectionView!
   
    private let collectionViewLayout = CollectionViewLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
        navigationItem.title = " Your Orders"
    }
    private func configuration() {
        collectionView.collectionViewLayout = collectionViewLayout.createOrderLayout()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: OrdersViewController.cellid2)
        collectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: CollectionViewLayout.headerid2, withReuseIdentifier: OrdersViewController.headerid2)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    
    }
}


