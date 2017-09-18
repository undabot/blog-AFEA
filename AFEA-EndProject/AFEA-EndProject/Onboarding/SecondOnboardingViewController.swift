//
//  SecondOnboardingViewController.swift
//  AFEA-StarterProject
//
//  Created by Azzaro Mujic on 10/09/2017.
//  Copyright © 2017 Azzaro Mujic. All rights reserved.
//

import UIKit

class SecondOnboardingViewController: UIViewController {

    @IBOutlet weak var bigFishContainerView: UIView!
    @IBOutlet weak var bigFishImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
    }
    
    private func setUpViews() {
        bigFishContainerView.layer.cornerRadius = bigFishContainerView .frame.width/2
        bigFishContainerView.layer.borderWidth = 6
        bigFishContainerView.layer.borderColor = UIColor.purpleGrey.cgColor
    }

}
