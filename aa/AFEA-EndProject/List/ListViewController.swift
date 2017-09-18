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
    
    var foodModels: [FoodModel] = []
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(ListViewController.refresh(refreshControl:)), for: .valueChanged)
        
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foodModels = FoodModelFactory.foodModels()
        
        collectionView.refreshControl = refreshControl
    }

    @objc func refresh(refreshControl: UIRefreshControl) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.refreshControl.endRefreshing()
            self.collectionView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if
            let detailsViewController = segue.destination as? DetailsViewController,
            let foodModel = sender as? FoodModel {
            detailsViewController.foodModel = foodModel
        }
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
        performSegue(withIdentifier: "DetailsViewController", sender: foodModels[indexPath.row])
    }
    
}


