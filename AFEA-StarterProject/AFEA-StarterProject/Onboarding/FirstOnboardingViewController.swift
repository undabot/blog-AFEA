import UIKit

class FirstOnboardingViewController: UIViewController {

    @IBOutlet weak var breadContainerView: UIView!
    @IBOutlet weak var cheeseContainerView: UIView!
    @IBOutlet weak var fishContainerView: UIView!
    @IBOutlet weak var strawberryContainerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        createCircleBorders()
    }

    private func createCircleBorders() {
        let viewToColorMap: [UIView: UIColor] = [
            breadContainerView: UIColor.wheat,
            cheeseContainerView: UIColor.pastelRed,
            fishContainerView: UIColor.purpleGrey,
            strawberryContainerView: UIColor.sickGreen
        ]

        viewToColorMap.forEach { (view, color) in
            view.createCircleBorder(with: color)
        }
    }

}
