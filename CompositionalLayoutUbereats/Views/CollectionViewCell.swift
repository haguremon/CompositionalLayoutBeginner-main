//
//  Tab1CollectionViewCell.swift
//  CompositionalLayoutBeginner
//
//  Created by IwasakIYuta on 2021/08/05.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    let label = UILabel()
    let image = UIImage()
    let button = UIButton()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(label)
        addSubview(button)
    
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        //label.textAlignment = .center
        label.clipsToBounds = true
        label.frame.size = self.bounds.size        
        setButton()
       
    }
    private func setButton(){
        
        button.clipsToBounds = true
        //button.contentMode = .center
        button.layer.cornerRadius = 10
       //x y 苦手　ボタンの場所を指定すつ
        button.frame = CGRect(x: self.frame.maxX - 100,
                              y: self.frame.height - 50,
                              width: self.bounds.width / 4,
                              height: self.bounds.height / 2.5)
        
        button.addTarget(self, action: #selector(tap), for: UIControl.Event.touchUpInside)
        button.layer.shadowColor = UIColor.black.cgColor
               // 影の方向を設定 （下方向）
        button.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
               // 影の色の濃さを設定
        button.layer.shadowOpacity = 0.6
               // 影で囲う厚さ設定
        button.layer.shadowRadius = 1
        
    }
  
      
    @objc func tap(){
        button.alpha = 0.95
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.button.alpha = 1
        }
        print("Tapped")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
