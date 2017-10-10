//
//  ListToDetailsSegue.swift
//  AFEA-EndProject
//
//  Created by Azzaro Mujic on 27/09/2017.
//  Copyright © 2017 Azzaro Mujic. All rights reserved.
//

import UIKit

class ListToDetailsSegue: UIStoryboardSegue {

    override func perform() {
        let listViewController = source as! ListViewController
        let detailsViewController = destination as! DetailsViewController
        
        listViewController.navigationController?.delegate = self
        listViewController.navigationController?.pushViewController(detailsViewController, animated: true)
    }
    
}

// MARK: UINavigationControllerDelegate

extension ListToDetailsSegue: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
}

// MARK: UIViewControllerAnimatedTransitioning

extension ListToDetailsSegue: UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let listViewController: ListViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) as! ListViewController
        let detailsViewController: DetailsViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as! DetailsViewController
        
        let containerView = transitionContext.containerView
        containerView.addSubview(detailsViewController.view)
        detailsViewController.view.alpha = 0

        let selectedCell = listViewController.collectionView.cellForItem(at: listViewController.lastSelectedIndexPath) as! ListItemCollectionViewCell
        let selectedImageView = selectedCell.imageView
        let selectedLabel = selectedCell.titleLabel
        let selectedCircleView = selectedCell.circleView
        let circleCopyView = UIView()
        circleCopyView.backgroundColor = UIColor.clear
        circleCopyView.layer.cornerRadius = selectedCircleView!.layer.cornerRadius
        circleCopyView.layer.borderWidth = selectedCircleView!.layer.borderWidth
        circleCopyView.layer.borderColor = selectedCircleView!.layer.borderColor
        containerView.addSubview(circleCopyView)
        circleCopyView.frame = (selectedCell.circleView.superview?.convert(selectedCell.circleView.frame, to: containerView))!
        
        let selectedLabelFromFrame = selectedLabel!.frame
        let selectedImageViewFromFrame = selectedImageView!.frame
        let selectedLabelFromFont = selectedLabel?.font
        
        listViewController.collectionView.visibleCells.forEach({ (cell) in
            let listItemCell = cell as! ListItemCollectionViewCell
            if selectedCell != listItemCell {
                listItemCell.animatedCircleView.animateCircle(duration: 0.25, percentage: 1)
            }
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            listViewController.collectionView.visibleCells.forEach({ (cell) in
                let listItemCell = cell as! ListItemCollectionViewCell
                listItemCell.animatedCircleView.isHidden = true
                listItemCell.circleView.isHidden = true
            })
            selectedImageView?.contentMode = .scaleAspectFill
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            selectedLabel?.animateToFont(detailsViewController.titleLabel.font, withDuration: 0.45)
        }
        
        UIView.animate(withDuration: 0.45, delay: 0.3, options: .curveEaseInOut, animations: {
            listViewController.collectionView.visibleCells.forEach({ (cell) in
                let listItemCell = cell as! ListItemCollectionViewCell
                if selectedCell != listItemCell {
                    listItemCell.alpha = 0
                    listItemCell.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                }
            })
            
            selectedImageView?.frame = (detailsViewController.imageView.superview?.convert(detailsViewController.imageView.frame, to: selectedImageView?.superview))!
            selectedLabel?.center = (detailsViewController.titleLabel.superview?.convert(detailsViewController.titleLabel.center, to: selectedLabel?.superview))!
            circleCopyView.frame = (detailsViewController.bigCircleView.superview?.convert(detailsViewController.bigCircleView.frame, to: containerView))!
            circleCopyView.layer.cornerRadius = circleCopyView.frame.width/2
            circleCopyView.layer.borderColor = UIColor.darkGrey.cgColor
        }) { (_) in
            UIView.animate(withDuration: 0.4, animations: {
                circleCopyView.alpha = 0
                circleCopyView.layer.borderColor = UIColor.coolGrey.cgColor
            }, completion: { (_) in
                circleCopyView.removeFromSuperview()
            })
            
            selectedImageView?.frame = detailsViewController.imageView.frame
            
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            
            detailsViewController.updateView()
            detailsViewController.view.alpha = 1
            
            listViewController.collectionView.visibleCells.forEach({ (cell) in
                let listItemCell = cell as! ListItemCollectionViewCell
                listItemCell.transform = .identity
                listItemCell.alpha = 1
                listItemCell.animatedCircleView.isHidden = false
                listItemCell.animatedCircleView.setPercentage(0)
                listItemCell.circleView.isHidden = false
                
                selectedLabel?.frame = selectedLabelFromFrame
                selectedImageView?.frame = selectedImageViewFromFrame
                selectedImageView?.contentMode = .scaleAspectFit
                selectedLabel?.font = selectedLabelFromFont
                selectedLabel?.transform = .identity
            })
        }
        
    }
    
}
