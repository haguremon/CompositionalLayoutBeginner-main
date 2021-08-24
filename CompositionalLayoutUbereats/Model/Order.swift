//
//  Order.swift
//  CompositionalLayoutUbereats
//
//  Created by IwasakIYuta on 2021/08/06.
//

import Foundation
//コアデータとかれなむでもやってみる
struct Order {
    let shopName: String
    let itemCount: Int
    let date: Date
    init(shopName: String, itemCount: Int, date: Date) {
        self.shopName = shopName
        self.itemCount = itemCount
        self.date = date
    }
}
