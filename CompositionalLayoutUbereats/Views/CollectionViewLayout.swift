//
//  CollectionViewLayout.swift
//  CompositionalLayoutBeginner
//
//  Created by IwasakIYuta on 2021/08/05.
//

import Foundation
import UIKit

class CollectionViewLayout {
    
    static let headerid = "header"
    
    func createHomeLayout() ->  UICollectionViewLayout {
        
        let layout = UICollectionViewCompositionalLayout { [ weak self ]  sectionIndex, environment in
            
            if sectionIndex == 0 {
                
            return self?.homeCategories()
            
            } else if sectionIndex == 3 {
                    
                    return self?.scrollhome()
                }
            else if sectionIndex == 5 {
                
                return self?.scrollHeaderHome()
            } else if sectionIndex == 7 {
                
                return self?.home4Categories()
            }
            
            
           
            return self?.createhome1()
            
            
        }
        
        return layout
    
    }
    
    private func homeCategories()->  NSCollectionLayoutSection {
        
        //3　itemを作成する
        let item = NSCollectionLayoutItem(layoutSize: .init(
                                            widthDimension: .fractionalWidth(0.25), //グループの90%の幅でitemの幅が22.5
                                                heightDimension: .fractionalHeight(1)))//100% 90
            
        
        //4　1つ90の高さのアイテムが3つ重なってるのでここでアイテム毎の間をあける（幅は90%のアイテム）
            item.contentInsets = .init(top: 0, leading: 1, bottom: 0, trailing: 3)
            
            //2 グループを作成　グループのサイズを決める
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(
                                                            widthDimension: .fractionalWidth(0.9),//90%fractional（分数）
                                                            heightDimension: .absolute(90)), //absolute(絶対)90の高さグループ
                                                           subitems: [item])
       //*4//ここでも切ることができるよ
        group.contentInsets.bottom = 1
        group.contentInsets.top = 1
        //1　sectionを作成
        let section = NSCollectionLayoutSection(group: group)
        //５　スクロールさせたい場合　　スクロールしてない状態だとグループが３つ縦に並んでる状態になる
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets.top = 1
        section.contentInsets.bottom = 5
            return section
            
        }
    
    
    private func createhome1() -> NSCollectionLayoutSection {
        
        //3アイテムを作る
        let item = NSCollectionLayoutItem(layoutSize: .init(
                                            widthDimension: .fractionalWidth(1),//100%の幅
                                            heightDimension: .absolute(200)))//アイテムの高さの絶対値を200
        //4　heightが1000ポイのが作成されるのでここで切る
        item.contentInsets = .init(top: 2, leading: 1, bottom: 7, trailing: 1)
        //2グループを作る
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(
                                                        widthDimension: .fractionalWidth(1),//幅100％
                                                        heightDimension: .estimated(1000)),//グループの推定値1000の幅
                                                       subitems: [item])
        group.contentInsets = .init(top: 3, leading: 5, bottom: 0, trailing: 5)
        //１.セクションを作る
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
   
    //Scroll
    private func scrollhome() -> NSCollectionLayoutSection {
        //3 アイテムを作成
        let item = NSCollectionLayoutItem(layoutSize: .init(
                                            widthDimension: .fractionalWidth(1), //グループの100%
                                            heightDimension: .absolute(150)))//絶対値150の高さ
        // 4推定値1000（高さ）と幅が100%のグループが作成されるため　contentInsetsを使って間を開けてアイテムをちゃんと表示させるようにする
        item.contentInsets = .init(top: 2, leading: 1, bottom: 7, trailing: 1)
        
        //2 グループ作成
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(
                                                        widthDimension: .fractionalWidth(1),//幅100%
                                                        heightDimension: .estimated(1000)), //推定値1000の高さのグループ
                                                       subitems: [item])
        group.contentInsets = .init(top: 3, leading: 5, bottom: 7, trailing: 5)
        group.accessibilityScroll(UIAccessibilityScrollDirection(rawValue: 1)!)
        //1 sectionを作成
        let section = NSCollectionLayoutSection(group: group)
        //5 縦に並んでるをスクロールさせたい場合horizontal（平行）
        section.orthogonalScrollingBehavior = .paging
        return section
    }
    
    private func scrollHeaderHome()-> NSCollectionLayoutSection {
        //3 アイテム作成
        let item = NSCollectionLayoutItem(layoutSize: .init(
                                            widthDimension: .fractionalWidth(1),//幅は100％
                                            heightDimension: .absolute(150)))//絶対値150の高さ
        
        //4 高さ150のアイテムが重なって表示されるためにここで間を開ける
        item.contentInsets = .init(top: 2, leading: 5, bottom: 7, trailing: 7)
       
        
        //2 グループ作成//セッションみたいな物
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(
                                                        widthDimension: .fractionalWidth(1),//幅は100％
                                                        heightDimension: .estimated(500)),//グループの推定値500の高さ //グループの推定値 1000
                                                       subitems: [item])
        //
        group.contentInsets = .init(top: 3, leading: 5, bottom: 5, trailing: 5)
       
        //1　セッションを作成
        let section = NSCollectionLayoutSection(group: group)
                
        //7 boundarySupplementaryItemsを使ってheaderやfooterを作成することができる（ReusableView）
        section.boundarySupplementaryItems =
                    [
                        .init(layoutSize: .init(
                                widthDimension: .fractionalWidth(0.95),
                                heightDimension: .absolute(50)),//上二つでサイズを決めることができる
                              elementKind: CollectionViewLayout.headerid , //名前を指定//forSupplementaryViewOfKindと位置してる必要がある
                              alignment: .topTrailing)//ReusableView設置する場所を指定
        //collectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: CollectionViewLayout.headerid, withReuseIdentifier: HomeViewController.headerid)
                    ]

        //6 縦に並んでるセルを横でスクロールさせたい場合ここでスクロールすることができる
        section.orthogonalScrollingBehavior = .paging
        
        
        return section
    }
    //スクロールありでしかも四分割のせるをスクロール
    private func home4Categories()->  NSCollectionLayoutSection {
        
        //3グループの中にあるアイテムを作成高さが40, 1/4の幅
        let item = NSCollectionLayoutItem(layoutSize: .init(
                                            widthDimension: .fractionalWidth(1), //アイテムの幅25％グループの幅の25％
                                            heightDimension: .absolute(40)))//アイテムの絶対値の高さなのestimated寄って色々と変わるよー
        //4 アイテムの間を開ける
        item.contentInsets = .init(top: 0, leading: 5, bottom: 5, trailing: 5)
        item.accessibilityScroll(.right)
        //2 グループを作成　グループのサイズを決める （vertical）アイテムが縦に2個並ぶ　グループを作成  subitem: item,count:2
        let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(
                                                        widthDimension: .fractionalWidth(0.45), //
                                                        heightDimension: .estimated(110)), //グループの推定値を110
                                                       subitem: item,count: 2)//
        
        group.contentInsets.trailing = 0
        //　1セクションを決める
        let section = NSCollectionLayoutSection(group: group)
        
        //5　基本的に縦に並んでることが多い　横にスクロールさせる機能
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets.top = 1

            return section
            
        }
    
    
    
    
    
   
    
    //BrowseVC
    
    static let headerid1 = "headerid1"
    
    func createBrowseLayout() ->  UICollectionViewLayout {
        
        let layout = UICollectionViewCompositionalLayout { [ weak self ] sectionIndex, environment in
            
                return   self?.browseCategories()
            
        }
        
        return layout
    
    }
    
    private func browseCategories() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(layoutSize: .init(
                                            widthDimension: .fractionalWidth(0.5),
                                            heightDimension: .absolute(150)))
        item.contentInsets = .init(top: 2, leading: 8, bottom: 12, trailing: 8)
        
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(
                                                        widthDimension: .fractionalWidth(1),
                                                        heightDimension: .estimated(1000)),
                                                       subitems: [item])
        group.contentInsets = .init(top: 3, leading: 10, bottom: 0, trailing: 10)
        
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.boundarySupplementaryItems =
            [
                .init(layoutSize: .init(
                        widthDimension: .fractionalWidth(0.95),
                        heightDimension: .absolute(60)),
                      elementKind: CollectionViewLayout.headerid1 ,
                      alignment: .topTrailing)
                
            ]
        
        return section
    
    }
  
    
    
    
    
    
    //OrderVC
    
    static let headerid2 = "headerid2"
    
    func createOrderLayout() ->  UICollectionViewLayout {
        
        let layout = UICollectionViewCompositionalLayout { sectionIndex, environment in
            
            let item = NSCollectionLayoutItem(layoutSize: .init(
                                                widthDimension: .fractionalWidth(1),
                                                heightDimension: .absolute(90)))
            item.contentInsets = .init(top: 1, leading: 5, bottom: 0, trailing: 5)
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(
                                                            widthDimension: .fractionalWidth(1),
                                                            heightDimension: .estimated(900)),
                                                           subitems: [item])
            group.contentInsets = .init(top: 10, leading: 5, bottom: 0, trailing: 5)
            let section = NSCollectionLayoutSection(group: group)
            section.boundarySupplementaryItems =
                [
                    .init(layoutSize: .init(
                            widthDimension: .fractionalWidth(0.95),
                            heightDimension: .absolute(60)),
                          elementKind: CollectionViewLayout.headerid2 ,
                          alignment: .topTrailing)
                    
                ]
            return section
            
        }
        
        return layout
    
    }
   
    
}

