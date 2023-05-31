import UIKit
import SnapKit

internal final class DetailPresentable: PresentableView {
        
    internal var dollar: UILabel = .init()
    internal var dollar1: UILabel = .init()
    internal var dollar2: UILabel = .init()
    internal var priceUsd: UILabel = .init()
    internal var changePercent24Hr: UILabel = .init()

    internal var marketCapUsdLabel: UILabel = .init()
    internal var supplyLabel: UILabel = .init()
    internal var volume24hLabel: UILabel = .init()
    
    internal var marketCapUsd: UILabel = .init()
    internal var supply: UILabel = .init()
    internal var volumeUsd24Hr: UILabel = .init()
    
    internal var fourStackView: UIStackView = .init()
    
    internal var name: UILabel = .init()
    
    internal override func onAddSubView() {
        
        addSubview(dollar)
        addSubview(dollar1)
        addSubview(dollar2)
        addSubview(priceUsd)
        addSubview(marketCapUsdLabel)
        addSubview(supplyLabel)
        addSubview(volume24hLabel)
        addSubview(marketCapUsd)
        addSubview(supply)
        addSubview(volumeUsd24Hr)

    }
    
    internal override func onConfigureView() {
        super.onConfigureView()
        
        dollar.text = "$"
        dollar.font = UIFont.systemFont(ofSize: 35)
        dollar.textColor = .white
        
        dollar1.text = "$"
        dollar1.font = UIFont.systemFont(ofSize: 25)
        dollar1.textColor = .white
        
        dollar2.text = "$"
        dollar2.font = UIFont.systemFont(ofSize: 25)
        dollar2.textColor = .white
        
        priceUsd.font = UIFont.systemFont(ofSize: 35)
        priceUsd.textColor = .white
        
        marketCapUsdLabel.text = "Market Cap"
        marketCapUsdLabel.font = UIFont.systemFont(ofSize: 15)
        marketCapUsdLabel.textColor = .white
        
        supplyLabel.text = "Supply"
        supplyLabel.font = UIFont.systemFont(ofSize: 15)
        supplyLabel.textColor = .white
        
        volume24hLabel.text = "Volume 24Hr"
        volume24hLabel.font = UIFont.systemFont(ofSize: 15)
        volume24hLabel.textColor = .white
        
        marketCapUsd.font = UIFont.systemFont(ofSize: 25)
        marketCapUsd.textColor = .white
        
        supply.font = UIFont.systemFont(ofSize: 25)
        supply.textColor = .white
        
        volumeUsd24Hr.font = UIFont.systemFont(ofSize: 25)
        volumeUsd24Hr.textColor = .white
        
    }
    
    internal override func onSetupConstraint() {
        
        dollar.snp.makeConstraints { make in
            make.top.equalTo(100)
            make.leading.equalTo(10)
        }
        
        priceUsd.snp.makeConstraints { make in
            make.top.equalTo(100)
            make.leading.equalTo(dollar.snp.trailing).offset(10)
        }
        
        marketCapUsdLabel.snp.makeConstraints { make in
            make.top.equalTo(dollar.snp.bottom).offset(10)
            make.leading.equalTo(10)
        }
        
        supplyLabel.snp.makeConstraints { make in
            make.top.equalTo(dollar.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        volume24hLabel.snp.makeConstraints { make in
            make.top.equalTo(dollar.snp.bottom).offset(10)
            make.trailing.equalTo(-10)
        }
        
        dollar1.snp.makeConstraints { make in
            make.top.equalTo(marketCapUsdLabel.snp.bottom).offset(10)
            make.leading.equalTo(10)
        }
        
        marketCapUsd.snp.makeConstraints { make in
            make.top.equalTo(marketCapUsdLabel.snp.bottom).offset(10)
            make.leading.equalTo(dollar1.snp.trailing)
        }
        
        supply.snp.makeConstraints { make in
            make.top.equalTo(supplyLabel.snp.bottom).offset(10)
            make.leading.equalTo(supplyLabel)
        }
        
        dollar2.snp.makeConstraints { make in
            make.top.equalTo(volume24hLabel.snp.bottom).offset(10)
            make.trailing.equalTo(volumeUsd24Hr.snp.leading)
        }
        
        volumeUsd24Hr.snp.makeConstraints { make in
            make.top.equalTo(volume24hLabel.snp.bottom).offset(10)
            make.trailing.equalTo(-10)
        }
        
        

    }
}
