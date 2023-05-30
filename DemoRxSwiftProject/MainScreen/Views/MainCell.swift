import UIKit
import SnapKit

internal final class MainCell: UITableViewCell {
    internal static let identifier: String = "MainCell"
    private lazy var nameLabel: UILabel = LabelBuilder().build()
    private lazy var costUSDLabel: UILabel = LabelBuilder().build()
    private lazy var symbolLabel: UILabel = LabelBuilder().build()
    private lazy var changePercent24HrLabel: UILabel = LabelBuilder().build()
    
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
        addSubview(changePercent24HrLabel)
    }
    
    private func onSetupConstraints() {
        nameLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().offset(15)
            $0.right.equalTo(super.snp.centerX)
        }
        costUSDLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.top)
            $0.right.equalToSuperview()
        }
        symbolLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom)
            $0.left.equalToSuperview().offset(15)
            $0.right.equalTo(super.snp.centerX)
        }
        changePercent24HrLabel.snp.makeConstraints {
            $0.top.equalTo(symbolLabel.snp.top)
            $0.right.equalToSuperview()
        }
        
  
    }
    
    internal func configureCell(name: String, costUSD: String, symbol: String, changePercent24Hr: String) {
        
        nameLabel.text = name
        costUSDLabel.text = "$ \(stringExt(from: costUSD))"
        symbolLabel.text = symbol
        changePercent24HrLabel.text = stringExt(from: changePercent24Hr)
        var isPositive = !changePercent24Hr.contains("-")
        changePercent24HrLabel.textColor =  isPositive ? UIColor.green : UIColor.red
    }
    
    func stringExt(from numberString: String) -> String {
        if let dotIndex = numberString.firstIndex(of: ".") {
            let endIndex = numberString.index(dotIndex, offsetBy: 3)
            return String(numberString[..<endIndex])
        }
        return numberString
    }
    
 
}
