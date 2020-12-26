import UIKit

protocol CountViewType: class {
    var presenter: CountPresenterType { get }
    func updateDecrementButton(isEnabled: Bool, alpha: CGFloat)
    func updateCountLabel(count: String)
}

final class MVPSampleViewController: UIViewController, CountViewType {

    @IBOutlet private weak var incrementButton: UIButton!
    @IBOutlet private weak var decrementButton: UIButton!
    @IBOutlet private weak var countLabel: UILabel!
    
    private(set) lazy var presenter: CountPresenterType = CountPresenter(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = presenter
    }
    
    @IBAction private func incrementButtonTapped(_ sender: UIButton) {
        presenter.increment()
    }
    
    @IBAction private func decrementButtonTapped(_ sender: UIButton) {
        presenter.decrement()
    }
    
    func updateDecrementButton(isEnabled isEnable: Bool, alpha: CGFloat) {
        decrementButton.isEnabled = isEnable
        decrementButton.alpha = alpha
    }
    
    func updateCountLabel(count: String) {
        countLabel.text = count
    }
}

