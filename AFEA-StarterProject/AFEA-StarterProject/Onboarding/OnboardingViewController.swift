import UIKit

extension UIScrollView {

    var currentPage: Int {
        return Int((contentOffset.x / frame.width).rounded())
    }
}

class OnboardingViewController: UIViewController {

    @IBOutlet weak var stepLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    @IBAction func skipButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "ListViewController", sender: nil)
    }

    @IBAction func nextButtonTapped(_ sender: UIButton) {
        if scrollView.currentPage == 2 {
            performSegue(withIdentifier: "ListViewController", sender: nil)
        } else {
            let xContentOffestToScroll = scrollView.frame.width * CGFloat(scrollView.currentPage + 1)
            scrollView.setContentOffset(CGPoint(x: xContentOffestToScroll, y: 0), animated: true)
        }
    }

}

// MARK: UIScrollViewDelegate

extension OnboardingViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = scrollView.currentPage
        stepLabel.text = getStepFor(page: scrollView.currentPage)
        nextButton.setTitle(getTitleFor(page: scrollView.currentPage), for: .normal)
    }

    fileprivate func getStepFor(page: Int) -> String {
        return "Step \(page + 1)"
    }

    fileprivate func getTitleFor(page: Int) -> String {
        return page == 2 ? "Got it!" : "Next"
    }
}
