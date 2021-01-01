import UIKit
import RxSwift
import RxCocoa

final class MVVMRxSwiftSampleViewController: UIViewController {

    @IBOutlet private weak var incrementButton: UIButton!
    @IBOutlet private weak var decrementButton: UIButton!
    @IBOutlet private weak var countLabel: UILabel!
    
    private lazy var viewModel: Rx.CountViewModel = {
        return .init(incrementButtonTapped: self.incrementButton.rx.tap.asObservable(),
                     decrementButtonTapped: self.decrementButton.rx.tap.asObservable())
    }()
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.isDecrementEnabled
            .bind(to: decrementButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        viewModel.decrementAlpha
            .bind(to: decrementButton.rx.alpha)
            .disposed(by: disposeBag)
        
        viewModel.count
            .bind(to: countLabel.rx.text)
            .disposed(by: disposeBag)
    }


}

