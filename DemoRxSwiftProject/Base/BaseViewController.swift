
import UIKit
import RxSwift
import RxCocoa
import UIKit

open class BaseViewController<View: UIView>: UIViewController {
    internal var content: View {
        view as! View
    }
    open lazy var disposableBag: DisposeBag = .init()

    open override func loadView() {
        view = View()
        
        onConfigureController()
        onConfigureViewModel()
        onConfigureActions()
    }
    
    open func onConfigureController() {}
    
    open func onConfigureViewModel() {}
    
    open func onConfigureActions() {}
}

open class VMController<View: UIView, VMInput>: BaseViewController<View> {
    open lazy var viewModel: VMInput = Swinjectable.container.resolve(VMInput.self)!
}
