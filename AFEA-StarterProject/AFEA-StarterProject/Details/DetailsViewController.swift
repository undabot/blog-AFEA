import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var circleContainerView: UIView!
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var leftBottomLabel: UILabel!
    @IBOutlet weak var middleBottomLabel: UILabel!
    @IBOutlet weak var rightBottomLabel: UILabel!

    var foodModel: FoodModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = foodModel.photo
        titleLabel.text = foodModel.title
        subtitleLabel.text = foodModel.subtitle

        leftBottomLabel.text = formatAsPercentage(foodModel.carbohydrates)
        middleBottomLabel.text = formatAsPercentage(foodModel.protein)
        rightBottomLabel.text = formatAsPercentage(foodModel.fatt)

        let bigCircleView = CircleView(frame: circleContainerView.bounds, frontgroundColor: .pastelRed)
        circleContainerView.addSubview(bigCircleView)

        let mediumFrame = circleContainerView.bounds.insetBy(dx: 16, dy: 16)
        let mediumCircleView = CircleView(frame: mediumFrame, frontgroundColor: .purpleGrey)
        circleContainerView.addSubview(mediumCircleView)

        let smallFrame = mediumFrame.insetBy(dx: 16, dy: 16)
        let smallCircleView = CircleView(frame: smallFrame, frontgroundColor: .darkSkyBlue)
        circleContainerView.addSubview(smallCircleView)

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            bigCircleView.animateFill(over: 1, to: self.foodModel.carbohydrates)
            mediumCircleView.animateFill(over: 1, to: self.foodModel.protein)
            smallCircleView.animateFill(over: 1, to: self.foodModel.fatt)
        }
    }

    fileprivate func formatAsPercentage(_ number: Double) -> String? {
        return NumberFormatter.percentage.string(from: NSNumber(value: number))
    }
}
