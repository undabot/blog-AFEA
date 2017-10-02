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
    
    lazy var firstFromContainerFrame: CGRect = {
        return self.firstOndboardingViewController.breadContainerView.frame
    }()
    
    lazy var secondFromContainerFrame: CGRect = {
        return self.firstOndboardingViewController.cheeseContainerView.frame
    }()
    
    lazy var thirdFromContainerFrame: CGRect = {
        return self.firstOndboardingViewController.fishContainerView.frame
    }()
    
    lazy var fourthFromContainerFrame: CGRect = {
        return self.firstOndboardingViewController.strawberryContainerView.frame
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
        print(scrollView.contentOffset.x/scrollView.frame.width)
        
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
        
        // first box
        let firstToContainerFrame = toTransitionFrame(fromFrame: firstFromContainerFrame, toFrame: toContainerFrame, percentage: firstPagePercentage)
        
        firstOndboardingViewController.breadContainerView.frame = firstToContainerFrame
        firstOndboardingViewController.breadContainerView.layer.cornerRadius = firstToContainerFrame.width/2
        
        firstOndboardingViewController.breadImageView.frame.size = toImageSize
        firstOndboardingViewController.breadImageView.center = firstOndboardingViewController.breadContainerView.center
        
        // second box
        let secondToContainerFrame = toTransitionFrame(fromFrame: secondFromContainerFrame, toFrame: toContainerFrame, percentage: firstPagePercentage)
        
        firstOndboardingViewController.cheeseContainerView.frame = secondToContainerFrame
        firstOndboardingViewController.cheeseContainerView.layer.cornerRadius = secondToContainerFrame.width/2
        
        firstOndboardingViewController.cheeseImageView.frame.size = toImageSize
        firstOndboardingViewController.cheeseImageView.center = firstOndboardingViewController.cheeseContainerView.center
        
        // third box
        let thirdToContainerFrame = toTransitionFrame(fromFrame: thirdFromContainerFrame, toFrame: toContainerFrame, percentage: firstPagePercentage)
        
        firstOndboardingViewController.fishContainerView.frame = thirdToContainerFrame
        firstOndboardingViewController.fishContainerView.layer.cornerRadius = thirdToContainerFrame.width/2
        
        firstOndboardingViewController.fishImageView.frame.size = toImageSize
        firstOndboardingViewController.fishImageView.center = firstOndboardingViewController.fishContainerView.center
        
        // third box
        let fourthToContainerFrame = toTransitionFrame(fromFrame: fourthFromContainerFrame, toFrame: toContainerFrame, percentage: firstPagePercentage)
        
        firstOndboardingViewController.strawberryContainerView.frame = fourthToContainerFrame
        firstOndboardingViewController.strawberryContainerView.layer.cornerRadius = fourthToContainerFrame.width/2
        
        firstOndboardingViewController.strawberryImageView.frame.size = toImageSize
        firstOndboardingViewController.strawberryImageView.center = firstOndboardingViewController.strawberryContainerView.center
        
        
        
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
        
        
        let boostedSecondPercentage = min(secondPagePercentage * 1, 1)
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

