//
//  CircleView.swift
//  AFEA-StarterProject
//
//  Created by Azzaro Mujic on 16/09/2017.
//  Copyright © 2017 Azzaro Mujic. All rights reserved.
//

import UIKit

class CircleView: UIView {

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var circleLayer: CAShapeLayer!
    var backCircleLayer: CAShapeLayer!
    
    init(frame: CGRect, lineWidth: CGFloat, backLayerColor: UIColor, frontLayerColor: UIColor?) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.clear
        
        // draw Back Circle
        // Use UIBezierPath as an easy way to create the CGPath for the layer.
        // The path should be the entire circle.
        let backCirclePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: (frame.size.width - 10)/2, startAngle: 0.0, endAngle: CGFloat(Double.pi * 2.0), clockwise: true)
        
        // Setup the CAShapeLayer with the path, colors, and line width
        backCircleLayer = CAShapeLayer()
        backCircleLayer.path = backCirclePath.cgPath
        backCircleLayer.fillColor = UIColor.clear.cgColor
        backCircleLayer.strokeColor = backLayerColor.cgColor
        backCircleLayer.lineWidth = lineWidth
        
        backCircleLayer.strokeEnd = 1
        
        // Add the circleLayer to the view's layer's sublayers
        layer.addSublayer(backCircleLayer)
        
        // Use UIBezierPath as an easy way to create the CGPath for the layer.
        // The path should be the entire circle.
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: (frame.size.width - 10)/2, startAngle: CGFloat(-Double.pi/2), endAngle: CGFloat(Double.pi * 1.5), clockwise: true)
        
        // Setup the CAShapeLayer with the path, colors, and line width
        circleLayer = CAShapeLayer()
        circleLayer.path = circlePath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.strokeColor = frontLayerColor?.cgColor ?? UIColor.clear.cgColor
        circleLayer.lineWidth = lineWidth
        
        // Don't draw the circle initially
        circleLayer.strokeEnd = 0.0
        
        // Add the circleLayer to the view's layer's sublayers
        layer.addSublayer(circleLayer)
    }
    
    func animateCircle(duration: TimeInterval, percentage: CGFloat) {
        // We want to animate the strokeEnd property of the circleLayer
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        
        // Set the animation duration appropriately
        animation.duration = duration
        
        // Animate from 0 (no circle) to percentage
        animation.fromValue = 0
        animation.toValue = percentage
        
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        // Set the circleLayer's strokeEnd property to 1.0 now so that it's the
        // right value when the animation ends.
        circleLayer.strokeEnd = percentage
        
        // Do the actual animation
        circleLayer.add(animation, forKey: "animateCircle")
    }
    
}
