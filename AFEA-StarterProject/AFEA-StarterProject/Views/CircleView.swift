import UIKit

class CircleView: UIView {

    private var foregroundCircle: CAShapeLayer!
    private var backgroundCircle: CAShapeLayer!

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(frame: CGRect, lineWidth: CGFloat = 6, backgroundColor: UIColor = .coolGrey, frontgroundColor: UIColor) {
        super.init(frame: frame)

        backgroundCircle = CAShapeLayer.circle(frame: bounds, strokeColor: backgroundColor, lineWidth: lineWidth)
        backgroundCircle.strokeEnd = 1

        foregroundCircle = CAShapeLayer.circle(frame: bounds, strokeColor: frontgroundColor, lineWidth: lineWidth)
        foregroundCircle.strokeEnd = 0.0

        self.backgroundColor = UIColor.clear
        layer.addSublayer(backgroundCircle)
        layer.addSublayer(foregroundCircle)
    }

    func animateFill(over duration: TimeInterval, to percentage: Double) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.duration = duration

        // Animate from 0 (no circle) to percentage
        animation.fromValue = 0
        animation.toValue = percentage

        // Set the circleLayer's strokeEnd property to 1.0 now so that it's the
        // right value when the animation ends.
        foregroundCircle.strokeEnd = CGFloat(percentage)

        foregroundCircle.add(animation, forKey: "animateCircle")
    }
}
