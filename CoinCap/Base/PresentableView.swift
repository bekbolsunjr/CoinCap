import UIKit
import SwiftUI
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
        
        //MARK: пытался сделать градиент 
//        var gradientColors: [CGColor] {
//              return [UIColor.red.cgColor, UIColor.blue.cgColor]
//          }
//
//          var gradientStartPoint: CGPoint {
//              return CGPoint(x: 0.5, y: 0)
//          }
//
//          var gradientEndPoint: CGPoint {
//              return CGPoint(x: 0.5, y: 1)
//          }
        backgroundColor = UIColor(named: "backgroundDetailScreen")
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
