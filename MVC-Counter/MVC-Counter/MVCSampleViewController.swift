import UIKit

final class MVCSampleViewController: UIViewController {

    @IBOutlet private weak var countLabel: UILabel!
    @IBOutlet private weak var incrementButton: UIButton!
    @IBOutlet private weak var decrementButton: UIButton!
    
    private let model = CountModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.countChanged = { [unowned self] in
            self.updateCountLabel()
            self.updateDecrementButton()
        }
        
        updateDecrementButton()
    }

    private func updateCountLabel() {
        countLabel.text = "\(model.count)"
    }
    
    private func updateDecrementButton() {
        let isEnabled = model.count > 0
        decrementButton.isEnabled = isEnabled
        decrementButton.alpha = isEnabled ? 1 : 0.5
    }
    
    @IBAction private func incrementButtonTapped(_ sender: UIButton) {
        model.increment()
    }
    
    @IBAction private func decrementButtonTapped(_ sender: UIButton) {
        model.decrement()
    }
}

