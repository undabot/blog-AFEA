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
    
    weak var firstOndboardingViewController: FirstOnboardingViewController!
    weak var secondOndboardingViewController: SecondOnboardingViewController!
    weak var thirdOndboardingViewController: ThirdOnboardingViewController!
    
    lazy var thirdFromContainerFrame: CGRect = {
        return self.firstOndboardingViewController.fishContainerView.frame
    }()
    
    lazy var firstFromImageFrame: CGRect = {
       return self.firstOndboardingViewController.breadImageView.frame
    }()
    
    lazy var secondAnimationFromFrame: CGRect = {
        return self.secondOndboardingViewController.bigFishContainerView.frame
    }()
    
    lazy var secondFromImageFrame: CGRect = {
        return self.secondOndboardingViewController.bigFishImageView.frame
    }()
    
    lazy var thirdScreenToFrame: CGRect = {
        return self.thirdOndboardingViewController.bigCircleView.frame
    }()
    
    var currentPage: Int {
        return Int((scrollView.contentOffset.x/scrollView.frame.width).rounded())
    }
    
    // MARK: Lifecycle
    
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
    
    // MARK: Action
    
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
    
    // MARK: Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let firstOndboardingViewController = segue.destination as? FirstOnboardingViewController {
            self.firstOndboardingViewController = firstOndboardingViewController
        }
        
        if let secondOndboardingViewController = segue.destination as? SecondOnboardingViewController {
            self.secondOndboardingViewController = secondOndboardingViewController
        }
        
        if let thirdOnboardingViewController = segue.destination as? ThirdOnboardingViewController {
            self.thirdOndboardingViewController = thirdOnboardingViewController
        }
    }
    
}

// MARK: UIScrollViewDelegate

extension OnboardingViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {        
        // current page
        let currentPage = self.currentPage
        
        stepLabel.text = "Step \(currentPage + 1)"
        pageControl.currentPage = currentPage
        
        // next button
        let nextButtonTitle = currentPage == 2 ? "Got it!" : "Next"
        nextButton.setTitle(nextButtonTitle, for: .normal)
        
        // first View
        let firstPagePercentage = scrollView.contentOffset.x/scrollView.frame.width
        
        firstOndboardingViewController.view.isHidden = firstPagePercentage > 1
        secondOndboardingViewController.view.isHidden = firstPagePercentage < 1
        
        var toContainerFrame = secondOndboardingViewController.bigFishContainerView.frame
        toContainerFrame.origin.x = toContainerFrame.origin.x + scrollView.frame.width
        
        var toImageSize = secondOndboardingViewController.bigFishImageView.frame.size
        toImageSize.width = firstFromImageFrame.width + (toImageSize.width - firstFromImageFrame.width) * firstPagePercentage
        toImageSize.height = firstFromImageFrame.height + (toImageSize.height - firstFromImageFrame.height) * firstPagePercentage
        
        let transform = CGAffineTransform(scaleX: 1 - firstPagePercentage, y: 1 - firstPagePercentage).concatenating(CGAffineTransform(translationX: scrollView.frame.width * firstPagePercentage, y: 0))
        // first box
            
        firstOndboardingViewController.breadContainerView.transform = transform
        firstOndboardingViewController.breadImageView.transform = transform
        
        // second box
        firstOndboardingViewController.cheeseContainerView.transform = transform
        firstOndboardingViewController.cheeseImageView.transform = transform
        
        // fourth box
        firstOndboardingViewController.strawberryContainerView.transform = transform
        firstOndboardingViewController.strawberryImageView.transform = transform
        
        // third box
        if firstPagePercentage > 0 {
            firstOndboardingViewController.fishContainerView.transform = .identity
            firstOndboardingViewController.fishImageView.transform = .identity
            
            let thirdToContainerFrame = toTransitionFrame(fromFrame: thirdFromContainerFrame, toFrame: toContainerFrame, percentage: firstPagePercentage)
            
            firstOndboardingViewController.fishContainerView.frame = thirdToContainerFrame
            firstOndboardingViewController.fishContainerView.layer.cornerRadius = thirdToContainerFrame.width/2
            
            firstOndboardingViewController.fishImageView.frame.size = toImageSize
            firstOndboardingViewController.fishImageView.center = firstOndboardingViewController.fishContainerView.center
        } else {
            firstOndboardingViewController.fishContainerView.transform = transform
            firstOndboardingViewController.fishImageView.transform = transform
        }

        
        // second animation
        let secondPagePercentage = scrollView.contentOffset.x/scrollView.frame.width - 1
        
        if secondPagePercentage < 0 || secondPagePercentage > 1 {
            return
        }
        
        thirdOndboardingViewController.smallCircleView.setPercentage(0.20 * secondPagePercentage)
        thirdOndboardingViewController.mediumCircleView.setPercentage(0.40 * secondPagePercentage)
        thirdOndboardingViewController.bigCircleView.setPercentage(0.80 * secondPagePercentage)
        
        var thirdScreenToFrame = self.thirdScreenToFrame
        thirdScreenToFrame.origin.x = thirdScreenToFrame.origin.x + scrollView.frame.width
        
        let boostedSecondPercentage = min(secondPagePercentage, 1)
        let toFrame = toTransitionFrame(fromFrame: secondAnimationFromFrame, toFrame: thirdScreenToFrame, percentage: boostedSecondPercentage)
        secondOndboardingViewController.bigFishContainerView.frame = toFrame
        secondOndboardingViewController.bigFishContainerView.layer.cornerRadius = toFrame.width/2
        
        var toThirdImageSize = thirdOndboardingViewController.fishImageView.frame.size
        toThirdImageSize.width = secondFromImageFrame.width + (toThirdImageSize.width - secondFromImageFrame.width) * boostedSecondPercentage
        toThirdImageSize.height = secondFromImageFrame.height + (toThirdImageSize.height - secondFromImageFrame.height) * boostedSecondPercentage
        
        secondOndboardingViewController.bigFishImageView.frame.size = toThirdImageSize
        secondOndboardingViewController.bigFishImageView.center = secondOndboardingViewController.bigFishContainerView.center
        
        
        thirdOndboardingViewController.smallCircleView.transform = CGAffineTransform(translationX: -scrollView.frame.width * (1 - secondPagePercentage), y: 0)
        thirdOndboardingViewController.mediumCircleView.transform = CGAffineTransform(translationX: -scrollView.frame.width * (1 - secondPagePercentage), y: 0)
        thirdOndboardingViewController.bigCircleView.transform = CGAffineTransform(translationX: -scrollView.frame.width * (1 - secondPagePercentage), y: 0)
        
        let alphaPercentage = (secondPagePercentage - 0.5)*2
        thirdOndboardingViewController.smallCircleView.alpha = alphaPercentage
        thirdOndboardingViewController.mediumCircleView.alpha = alphaPercentage
        thirdOndboardingViewController.bigCircleView.alpha = alphaPercentage
        
        secondOndboardingViewController.bigFishContainerView.alpha = 1 - alphaPercentage
        
    }
    
    private func toTransitionFrame(fromFrame: CGRect, toFrame: CGRect, percentage: CGFloat) -> CGRect {
        var toTransitionFrame = CGRect()
        toTransitionFrame.size.width = fromFrame.width + (toFrame.width - fromFrame.width) * percentage
        toTransitionFrame.size.height = fromFrame.height + (toFrame.height - fromFrame.height) * percentage
        toTransitionFrame.origin.x = fromFrame.origin.x + (toFrame.origin.x - fromFrame.origin.x) * percentage
        toTransitionFrame.origin.y = fromFrame.origin.y + (toFrame.origin.y - fromFrame.origin.y) * percentage
        
        return toTransitionFrame
    }
    
}

