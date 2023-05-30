import UIKit
import SnapKit

internal class MainPresentable: PresentableView {
    
    internal lazy var tableView: UITableView = .init(frame: .zero, style: .insetGrouped)
    
    override func onAddSubView() {
        addSubview(tableView)
    }
    
    override func onConfigureView() {
        super.onConfigureView()
        tableView.register(MainCell.self, forCellReuseIdentifier: MainCell.identifier)
        
    }
    
    override func onSetupConstraint() {
        tableView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
