import UIKit

class ListItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        circleView.createCircleBorder(with: .wheat)
    }

    func configure(with foodModel: FoodModel) {
        imageView.image = foodModel.photo
        titleLabel.text = foodModel.title
        circleView.layer.borderColor = foodModel.circleColor.cgColor
    }
}
