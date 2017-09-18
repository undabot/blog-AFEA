//
//  DetailsViewController.swift
//  AFEA-StarterProject
//
//  Created by Azzaro Mujic on 16/09/2017.
//  Copyright © 2017 Azzaro Mujic. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var circleContainerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var leftBottomLabel: UILabel!
    @IBOutlet weak var middleBottomLabel: UILabel!
    @IBOutlet weak var rightBottomLabel: UILabel!
    
    var foodModel: FoodModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = foodModel.photo
        titleLabel.text = foodModel.title
        subtitleLabel.text = foodModel.subtitle

        let bigCircleView = CircleView(frame: circleContainerView.bounds, lineWidth: 6, backLayerColor: UIColor.coolGrey, frontLayerColor: UIColor.pastelRed)
        circleContainerView.addSubview(bigCircleView)
        
        var mediumFrame = circleContainerView.bounds
        mediumFrame.size.width = mediumFrame.size.width - 42
        mediumFrame.size.height = mediumFrame.size.height - 42
        mediumFrame.origin.x = mediumFrame.origin.x + 21
        mediumFrame.origin.y = mediumFrame.origin.y + 21
        
        let mediumCircleView = CircleView(frame: mediumFrame, lineWidth: 6, backLayerColor: UIColor.coolGrey, frontLayerColor: UIColor.purpleGrey)
        circleContainerView.addSubview(mediumCircleView)
        
        
        var smallFrame = mediumFrame
        smallFrame.size.width = smallFrame.size.width - 42
        smallFrame.size.height = smallFrame.size.height - 42
        smallFrame.origin.x = smallFrame.origin.x + 21
        smallFrame.origin.y = smallFrame.origin.y + 21
        
        let smallCircleView = CircleView(frame: smallFrame, lineWidth: 6, backLayerColor: UIColor.coolGrey, frontLayerColor: UIColor.darkSkyBlue)
        circleContainerView.addSubview(smallCircleView)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            
            bigCircleView.animateCircle(duration: 1, percentage: self.foodModel.carbohydrates)
            mediumCircleView.animateCircle(duration: 1, percentage: self.foodModel.protein)
            smallCircleView.animateCircle(duration: 1, percentage: self.foodModel.fatt)
        }
        
        leftBottomLabel.text = "\(self.foodModel.carbohydrates)%"
        middleBottomLabel.text = "\(self.foodModel.protein)%"
        rightBottomLabel.text = "\(self.foodModel.fatt)%"
        
    }

}
