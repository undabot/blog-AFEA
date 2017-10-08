//
//  FoodModelFactory.swift
//  AFEA-StarterProject
//
//  Created by Azzaro Mujic on 16/09/2017.
//  Copyright © 2017 Azzaro Mujic. All rights reserved.
//

import Foundation
import UIKit

class FoodModelFactory {
    
    static func foodModels() -> [FoodModel] {
        
        var foodModels: [FoodModel] = []
        
        let foodModel1 = FoodModel(protein: 0.4, carbohydrates: 0.9, fatt: 0.4, photo: UIImage(named: "berry"), title: "Berry", subtitle: "What a nice fruit!", circleColor: UIColor.pastelRed)
        foodModels.append(foodModel1)
        
        let foodModel2 = FoodModel(protein: 0.5, carbohydrates: 0.3, fatt: 0.45, photo: UIImage(named: "bread"), title: "Bread", subtitle: "For every day!", circleColor: UIColor.wheat)
        foodModels.append(foodModel2)
        
        let foodModel3 = FoodModel(protein: 0.6, carbohydrates: 0.9, fatt: 0.6, photo: UIImage(named: "broccoli"), title: "Broccoli", subtitle: "Green is healthy!", circleColor: UIColor.sickGreen)
        foodModels.append(foodModel3)
        
        let foodModel4 = FoodModel(protein: 0.3, carbohydrates: 0.9, fatt: 0.2, photo: UIImage(named: "cake"), title: "Cake", subtitle: "So sweet!", circleColor: UIColor.wheat)
        foodModels.append(foodModel4)
        
        let foodModel5 = FoodModel(protein: 0.5, carbohydrates: 0.9, fatt: 0.4, photo: UIImage(named: "cheese"), title: "Cheese", subtitle: "Goes with wine!", circleColor: UIColor.pastelRed)
        foodModels.append(foodModel5)
        
        let foodModel6 = FoodModel(protein: 0.5, carbohydrates: 0.9, fatt: 0.2, photo: UIImage(named: "fish"), title: "Fish", subtitle: "Contains omega!", circleColor: UIColor.purpleGrey)
        foodModels.append(foodModel6)
        
        let foodModel7 = FoodModel(protein: 0.8, carbohydrates: 0.9, fatt: 0.6, photo: UIImage(named: "tomato"), title: "Tomato", subtitle: "Make a ketchup.", circleColor: UIColor.pastelRed)
        foodModels.append(foodModel7)
        
        let foodModel8 = FoodModel(protein: 0.5, carbohydrates: 0.9, fatt: 0.2, photo: UIImage(named: "fish"), title: "Fish", subtitle: "Contains omega!", circleColor: UIColor.purpleGrey)
        foodModels.append(foodModel8)
        
        let foodModel9 = FoodModel(protein: 0.6, carbohydrates: 0.9, fatt: 0.6, photo: UIImage(named: "broccoli"), title: "Broccoli", subtitle: "Green is healthy!", circleColor: UIColor.sickGreen)
        foodModels.append(foodModel9)
        
        let foodModel10 = FoodModel(protein: 0.4, carbohydrates: 0.9, fatt: 0.4, photo: UIImage(named: "berry"), title: "Berry", subtitle: "What a nice fruit!", circleColor: UIColor.pastelRed)
        foodModels.append(foodModel10)
        
        let foodModel11 = FoodModel(protein: 0.5, carbohydrates: 0.3, fatt: 0.45, photo: UIImage(named: "bread"), title: "Bread", subtitle: "For every day!", circleColor: UIColor.wheat)
        foodModels.append(foodModel11)
        
        return foodModels
    }
    
}
