//
//  UILabel.swift
//  AFEA-EndProject
//
//  Created by Azzaro Mujic on 27/09/2017.
//  Copyright © 2017 Azzaro Mujic. All rights reserved.
//

import UIKit

extension UILabel {
    func animateToFont(_ font: UIFont, withDuration duration: TimeInterval) {
        let oldFont = self.font
        let labelScale =  font.pointSize/oldFont!.pointSize
        UIView.animate(withDuration: duration, animations: {
            self.transform = CGAffineTransform(scaleX: labelScale, y: labelScale)
        }) { (_) in
            //self.font = font
            //self.sizeToFit()
        }
    }
}
