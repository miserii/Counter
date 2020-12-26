// MARK: - Presenter
import UIKit

protocol CountPresenterType: class {
    var view: CountViewType? { get }
    func increment()
    func decrement()
}

final class CountPresenter: CountPresenterType {
    
    private(set) weak var view: CountViewType?
    private var count: Int {
        didSet {
            didSetCount()
        }
    }
    
    init(view: CountViewType) {
        self.view = view
        self.count = 0
        didSetCount()
    }
    
    private func didSetCount() {
        let isEnabled = count > 0
        let alpha: CGFloat = isEnabled ? 1 : 0.5
        view?.updateDecrementButton(isEnabled: isEnabled, alpha: alpha)
        view?.updateCountLabel(count: "\(count)")
    }
    
    func increment() {
        count += 1
    }
    
    func decrement() {
        count -= 1
    }
    
    
}
