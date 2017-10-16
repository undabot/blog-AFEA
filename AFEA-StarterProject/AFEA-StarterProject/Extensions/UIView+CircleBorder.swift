import UIKit

extension UIView {

    func createCircleBorder(with color: UIColor, width: CGFloat = 6) {
        layer.cornerRadius = frame.width / 2
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
}
