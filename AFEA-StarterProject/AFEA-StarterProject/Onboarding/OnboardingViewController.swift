//
//  OnboardingViewController.swift
//  AFEA-StarterProject
//
//  Created by Azzaro Mujic on 10/09/2017.
//  Copyright © 2017 Azzaro Mujic. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var stepLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var currentPage: Int {
        return Int((scrollView.contentOffset.x/scrollView.frame.width).rounded())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    @IBAction func skipButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "ListViewController", sender: nil)
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        let currentPage = self.currentPage
        if currentPage == 2 {
            performSegue(withIdentifier: "ListViewController", sender: nil)
        } else {
            let xContentOffestToScroll = scrollView.frame.width * CGFloat(currentPage + 1)
            scrollView.setContentOffset(CGPoint(x: xContentOffestToScroll, y: 0), animated: true)
        }
    }
    
}

// MARK: UIScrollViewDelegate

extension OnboardingViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.x/scrollView.frame.width)
        let currentPage = self.currentPage
        
        stepLabel.text = "Step \(currentPage + 1)"
        pageControl.currentPage = currentPage
        
        let nextButtonTitle = currentPage == 2 ? "Got it!" : "Next"
        nextButton.setTitle(nextButtonTitle, for: .normal)
    }
    
}
