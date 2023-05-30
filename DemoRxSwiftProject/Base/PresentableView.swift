import UIKit
import SnapKit

open class PresentableView: UIView {
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        onConfigureView()
        onSetupTarget()
        onAddSubView()
        onSetupConstraint()
        accessibilityIdToViews()
    }
        
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Public functions
    open func onConfigureView() {
        backgroundColor = .white
    }
    
    open func onSetupTarget() {}

    open func onAddSubView() {}
    
    open func onSetupConstraint() {}
    
    open func onSetupFrame() {}
    
    open var accessibilityIdToViews: () -> Void { {} }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        self.onSetupFrame()
    }
    
    deinit {
        debugPrint("Deallocation \(self)")
    }
}
