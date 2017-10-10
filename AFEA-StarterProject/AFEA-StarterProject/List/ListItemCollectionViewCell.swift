//
//  ListItemCollectionViewCell.swift
//  AFEA-StarterProject
//
//  Created by Azzaro Mujic on 10/09/2017.
//  Copyright © 2017 Azzaro Mujic. All rights reserved.
//

import UIKit

class ListItemCollectionViewCell: UICollectionViewCell {
   
    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        circleView.layer.cornerRadius = circleView.frame.width/2
        circleView.layer.borderWidth = 6
        circleView.layer.borderColor = UIColor.wheat.cgColor
    }
    
    func configure(with foodModel: FoodModel) {
        imageView.image = foodModel.photo
        titleLabel.text = foodModel.title
        circleView.layer.borderColor = UIColor.darkGrey.cgColor
    }
    
}
