import UIKit

class SecondOnboardingViewController: UIViewController {

    @IBOutlet weak var bigFishContainerView: UIView!
    @IBOutlet weak var bigFishImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        bigFishContainerView.createCircleBorder(with: .purpleGrey)
    }
}
