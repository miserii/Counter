final class CountModel {
    private(set) var count: Int {
        didSet {
            countChanged?()
        }
    }
    
    var countChanged: (() -> ())?
    
    init() {
        self.count = 0
    }
    
    func increment() {
        count += 1
    }
    
    func decrement() {
        count -= 1
    }
}

