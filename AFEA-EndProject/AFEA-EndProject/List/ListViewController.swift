//
//  ListViewController.swift
//  AFEA-StarterProject
//
//  Created by Azzaro Mujic on 10/09/2017.
//  Copyright © 2017 Azzaro Mujic. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var lastSelectedIndexPath: IndexPath!
    var foodModels: [FoodModel] = []
    let refreshViewHeight: CGFloat = 62.0
    var refreshView: RefreshView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foodModels = FoodModelFactory.foodModels()
        
        let refreshRect = CGRect(x: 0.0, y: 0, width: view.frame.size.width, height: refreshViewHeight)
        refreshView = RefreshView(frame: refreshRect, scrollView: self.collectionView)
        refreshView.delegate = self
        view.addSubview(refreshView)
        view.bringSubview(toFront: refreshView)
        
        collectionView.backgroundColor = UIColor.clear
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if
            let detailsViewController = segue.destination as? DetailsViewController,
            let foodModel = sender as? FoodModel {
            detailsViewController.foodModel = foodModel
        }
    }
}

// MARK: Refresh control methods

extension ListViewController: RefreshViewDelegate {
    
    func refreshViewDidRefresh(refreshView: RefreshView) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            refreshView.endRefreshing()
        }
    }
    
}

// MARK: Scroll view methods

extension ListViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        refreshView.scrollViewDidScroll(scrollView)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        refreshView.scrollViewWillEndDragging(scrollView, withVelocity: velocity, targetContentOffset: targetContentOffset)
    }
    
}

// MARK: UICollectionViewDataSource

extension ListViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ListItemCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListItemCollectionViewCell", for: indexPath) as! ListItemCollectionViewCell
        cell.configure(with: foodModels[indexPath.row])
        
        return cell
    }
    
}

// MARK: UICollectionViewDelegate

extension ListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        lastSelectedIndexPath = indexPath
        performSegue(withIdentifier: "DetailsViewController", sender: foodModels[indexPath.row])
    }
    
}


