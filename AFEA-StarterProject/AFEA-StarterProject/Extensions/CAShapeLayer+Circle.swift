import UIKit

extension CAShapeLayer {

    static func circle(frame: CGRect, strokeColor: UIColor, lineWidth: CGFloat, fillColor: UIColor = .clear) -> CAShapeLayer {
        let path = UIBezierPath.circle(frame: frame)

        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.fillColor = fillColor.cgColor
        layer.strokeColor = strokeColor.cgColor
        layer.lineWidth = lineWidth

        return layer
    }
}
