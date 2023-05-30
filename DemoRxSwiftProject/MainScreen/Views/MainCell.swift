import UIKit
import SnapKit

internal final class MainCell: UITableViewCell {
    internal static let identifier: String = "MainCell"
    private lazy var nameLabel: UILabel = LabelBuilder().build()
    private lazy var costUSDLabel: UILabel = LabelBuilder().build()
    private lazy var symbolLabel: UILabel = LabelBuilder().build()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        onAddSubviews()
        onSetupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func onAddSubviews() {
        addSubview(nameLabel)
        addSubview(costUSDLabel)
        addSubview(symbolLabel)
    }
    
    private func onSetupConstraints() {
        nameLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().offset(15)
            $0.right.equalTo(super.snp.centerX)
        }
        costUSDLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().offset(15)
            $0.left.equalTo(super.snp.centerX)
        }
        symbolLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom)
            $0.left.equalToSuperview().offset(15)
            $0.right.equalTo(super.snp.centerX)
        }
        
  
    }
    
    internal func configureCell(name: String, costUSD: String, symbol: String) {
        
        nameLabel.text = name
        costUSDLabel.text = "$ \(costUSD)"
        symbolLabel.text = symbol
    }
    
 
}
