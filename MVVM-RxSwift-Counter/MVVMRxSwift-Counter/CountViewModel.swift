import UIKit
import RxSwift
import RxCocoa

enum Rx {
    final class CountViewModel {
        
        let count: Observable<String>
        let isDecrementEnabled: Observable<Bool>
        let decrementAlpha: Observable<CGFloat>
        
        private let disposeBag = DisposeBag()
        
        init(incrementButtonTapped: Observable<Void>,
             decrementButtonTapped: Observable<Void>) {
            
            let _count = BehaviorSubject<Int>(value: 0)
            let _isDecrementEnabled = _count.map { $0 > 0 }
            
            self.isDecrementEnabled = _isDecrementEnabled
            self.count = _count.map(String.init)
            self.decrementAlpha = _isDecrementEnabled.map { $0 ? 1 : 0.5 }
            
            Observable.merge(incrementButtonTapped.map { 1 },
                             decrementButtonTapped.map { -1 })
                .withLatestFrom(_count.asObserver()) { $1 + $0 }
                .bind(to: _count)
                .disposed(by: disposeBag)
        }
        
    }
}
