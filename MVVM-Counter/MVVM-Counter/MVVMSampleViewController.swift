import UIKit

final class MVVMSampleViewController: UIViewController {

    @IBOutlet private weak var incrementButton: UIButton!
    @IBOutlet private weak var decrementButton: UIButton!
    @IBOutlet private weak var countLabel: UILabel!
    
    private let viewModel = CountViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        incrementButton.addTarget(viewModel, action: #selector(CountViewModel.increment), for: .touchUpInside)
        decrementButton.addTarget(viewModel, action: #selector(CountViewModel.decrement), for: .touchUpInside)

        do {
            try viewModel.observe(keyPath: \.count, bindTo: countLabel, \.text)
            try viewModel.observe(keyPath: \.isDecrementEnabled, bindTo: decrementButton, \.isEnabled)
            try viewModel.observe(keyPath: \.decrementAlpha, bindTo: decrementButton, \.alpha)
        } catch let e {
            fatalError("\(e)")
        }
    }
}
