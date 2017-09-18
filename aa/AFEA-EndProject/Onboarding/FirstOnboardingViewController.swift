//
//  FirstOnboardingViewController.swift
//  AFEA-StarterProject
//
//  Created by Azzaro Mujic on 10/09/2017.
//  Copyright © 2017 Azzaro Mujic. All rights reserved.
//

import UIKit

class FirstOnboardingViewController: UIViewController {

    @IBOutlet weak var breadContainerView: UIView!
    @IBOutlet weak var breadImageView: UIImageView!
    @IBOutlet weak var cheeseContainerView: UIView!
    @IBOutlet weak var cheeseImageView: UIImageView!
    @IBOutlet weak var fishContainerView: UIView!
    @IBOutlet weak var fishImageView: UIImageView!
    @IBOutlet weak var strawberryContainerView: UIView!
    @IBOutlet weak var strawberryImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
    }
    
    private func setUpViews() {
        breadContainerView.layer.cornerRadius = breadContainerView.frame.width/2
        breadContainerView.layer.borderWidth = 6
        breadContainerView.layer.borderColor = UIColor.wheat.cgColor
        
        cheeseContainerView.layer.cornerRadius = breadContainerView.frame.width/2
        cheeseContainerView.layer.borderWidth = 6
        cheeseContainerView.layer.borderColor = UIColor.pastelRed.cgColor
        
        fishContainerView.layer.cornerRadius = breadContainerView.frame.width/2
        fishContainerView.layer.borderWidth = 6
        fishContainerView.layer.borderColor = UIColor.purpleGrey.cgColor
        
        strawberryContainerView.layer.cornerRadius = breadContainerView.frame.width/2
        strawberryContainerView.layer.borderWidth = 6
        strawberryContainerView.layer.borderColor = UIColor.sickGreen.cgColor
    }
    
}
