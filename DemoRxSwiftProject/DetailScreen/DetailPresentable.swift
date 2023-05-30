import UIKit
import SnapKit

internal final class DetailPresentable: PresentableView {
    
    internal var firstStakView: UIStackView = .init()
    
    internal var dollar: UILabel = .init()
    internal var priceUsd: UILabel = .init()
    internal var changePercent24Hr: UILabel = .init()
    
    internal var secondStakView: UIStackView = .init()
    
    internal var marketCapUsdLabel: UILabel = .init()
    internal var supplyLabel: UILabel = .init()
    internal var volume24h: UILabel = .init()
    
    internal var thredStakView: UIStackView = .init()
    
    internal var marketCapUsd: UILabel = .init()
    internal var supply: UILabel = .init()
    internal var volumeUsd24Hr: UILabel = .init()
    
    internal var fourStackView: UIStackView = .init()
    
    internal var name: UILabel = .init()
    
    internal override func onAddSubView() {
        
        addSubview(firstStakView)
        firstStakView.addArrangedSubview(dollar)
        firstStakView.addArrangedSubview(priceUsd)
        firstStakView.addArrangedSubview(changePercent24Hr)
        
        addSubview(secondStakView)
        secondStakView.addArrangedSubview(marketCapUsdLabel)
        secondStakView.addArrangedSubview(supplyLabel)
        secondStakView.addArrangedSubview(volume24h)
    
        addSubview(thredStakView)
        thredStakView.addArrangedSubview(marketCapUsd)
        thredStakView.addArrangedSubview(supply)
        thredStakView.addArrangedSubview(volumeUsd24Hr)
        
        addSubview(fourStackView)
        fourStackView.addArrangedSubview(firstStakView)
        fourStackView.addArrangedSubview(secondStakView)
        fourStackView.addArrangedSubview(thredStakView)
        
    
    }
    
    internal override func onConfigureView() {
        super.onConfigureView()

        //MARK: FirstStakView
        firstStakView.axis = .horizontal
        firstStakView.spacing = 5
        firstStakView.distribution = .fillEqually
        dollar.text = "$"
        
        //MARK: SekondStakView
        secondStakView.axis = .horizontal
        secondStakView.spacing = 5
        secondStakView.distribution = .fillEqually
        marketCapUsdLabel.text = "Market Cap"
        supplyLabel.text = "Supply"
        volume24h.text = "Volume 24Hr"
        
        //MARK: TherdStakView
        thredStakView.axis = .horizontal
        thredStakView.spacing = 5
        thredStakView.distribution = .fillEqually
        
        //MARK: FourStakView
        fourStackView.axis = .vertical
        fourStackView.spacing = 10
        fourStackView.addArrangedSubview(firstStakView)
        fourStackView.addArrangedSubview(secondStakView)
        fourStackView.addArrangedSubview(thredStakView)
        
    }
    
    internal override func onSetupConstraint() {
        
        fourStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }

    }
}
