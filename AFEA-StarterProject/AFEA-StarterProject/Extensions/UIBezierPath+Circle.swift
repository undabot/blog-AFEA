import UIKit

extension UIBezierPath {

    static func circle(frame: CGRect) -> UIBezierPath {
        return UIBezierPath(arcCenter: CGPoint(x: frame.midX, y: frame.midY),
                            radius: (frame.width - 10) / 2,
                            startAngle: -CGFloat.pi / 2.0,
                            endAngle: CGFloat.pi * 1.5,
                            clockwise: true)
    }
}
