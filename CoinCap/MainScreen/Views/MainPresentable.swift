import UIKit
import SnapKit

internal class MainPresentable: PresentableView {
    
    internal lazy var tableView: UITableView = .init(frame: .zero, style: .plain)
    
    override func onAddSubView() {
        addSubview(tableView)
    }
    
    override func onConfigureView() {
        super.onConfigureView()
        tableView.register(MainCell.self, forCellReuseIdentifier: MainCell.identifier)
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(named: "backgroundDetailScreen")
        
    }
    
    override func onSetupConstraint() {
        tableView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
