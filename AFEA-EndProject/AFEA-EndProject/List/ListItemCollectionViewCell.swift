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
    
    var animatedCircleView: CircleView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        circleView.layer.cornerRadius = circleView.frame.width/2
        circleView.layer.borderWidth = 6
        circleView.layer.borderColor = UIColor.wheat.cgColor
        
        animatedCircleView = CircleView(frame: circleView.frame, lineWidth: 7, backLayerColor: UIColor.clear, frontLayerColor: UIColor.white)
        contentView.addSubview(animatedCircleView)
        
    }
    
    func configure(with foodModel: FoodModel) {
        imageView.image = foodModel.photo
        titleLabel.text = foodModel.title
        circleView.layer.borderColor = foodModel.circleColor.cgColor
    }
    
}
