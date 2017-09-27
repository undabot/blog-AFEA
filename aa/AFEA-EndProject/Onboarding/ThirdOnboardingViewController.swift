//
//  ThirdOnboardingViewController.swift
//  AFEA-StarterProject
//
//  Created by Azzaro Mujic on 10/09/2017.
//  Copyright © 2017 Azzaro Mujic. All rights reserved.
//

import UIKit

class ThirdOnboardingViewController: UIViewController {

    var smallCircleView: CircleView!
    var mediumCircleView: CircleView!
    var bigCircleView: CircleView!
    
    @IBOutlet weak var fishImageView: UIImageView!
    @IBOutlet weak var circleHelperView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
    }
    
    private func setUpViews() {
        
        bigCircleView = CircleView(frame: circleHelperView.frame, lineWidth: 6, backLayerColor: UIColor.coolGrey, frontLayerColor: UIColor.pastelRed)
        
        var mediumFrame = circleHelperView.frame
        mediumFrame.size.width = mediumFrame.size.width - 42
        mediumFrame.size.height = mediumFrame.size.height - 42
        mediumFrame.origin.x = mediumFrame.origin.x + 21
        mediumFrame.origin.y = mediumFrame.origin.y + 21
        
        mediumCircleView = CircleView(frame: mediumFrame, lineWidth: 6, backLayerColor: UIColor.coolGrey, frontLayerColor: UIColor.purpleGrey)
        
        var smallFrame = mediumFrame
        smallFrame.size.width = smallFrame.size.width - 42
        smallFrame.size.height = smallFrame.size.height - 42
        smallFrame.origin.x = smallFrame.origin.x + 21
        smallFrame.origin.y = smallFrame.origin.y + 21
        
        smallCircleView = CircleView(frame: smallFrame, lineWidth: 6, backLayerColor: UIColor.coolGrey, frontLayerColor: UIColor.darkSkyBlue)
        
        view.addSubview(smallCircleView)
        view.addSubview(mediumCircleView)
        view.addSubview(bigCircleView)
        
    }
    
}
