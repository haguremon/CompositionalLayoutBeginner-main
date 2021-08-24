//
//  TableViewCell.swift
//  CompositionalLayoutUbereats
//
//  Created by IwasakIYuta on 2021/08/07.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    let label = UILabel()
    let image = UIImageView()
    override func awakeFromNib() {
        super.awakeFromNib()
        addSubview(label)
        addSubview(image)
        setViewSize()
    
    }
    private func setViewSize(){
    
        label.textAlignment = .center
        label.clipsToBounds = true
        label.frame.size = self.bounds.size
        image.frame.size.height = self.bounds.height
        image.layer.cornerRadius = self.bounds.height
        image.frame.size.width = self.bounds.width / 4
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        label.frame.size = self.bounds.size
//    }

}
