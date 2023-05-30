import Foundation
import UIKit
internal class StartPresentable: PresentableView {
    lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.spacing = 16
        view.axis = .vertical
        view.alignment = .center
        return view
    }()

    lazy var  primaryLabel: UILabel = LabelBuilder()
        .setAlignment(.center)
        .setFont(.systemFont(ofSize: 22, weight: .heavy))
        .setTextColor(.black)
        .setText("Тестовое задание")
        .build()

    lazy var  startButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "backgroundStartButton")
        button.layer.cornerRadius = 12
        button.setTitle("START", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        
        return button
    }()

    lazy var  imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "rphone")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    internal override func onAddSubView() {
        backgroundColor = UIColor(named: "backgroundStartScreen")
        addSubview(stackView)
        addSubview(startButton)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(primaryLabel)
    }
    
    internal override func onConfigureView() {
        super.onConfigureView()
        stackView.setCustomSpacing(10, after: imageView)
    }
    
    internal override func onSetupConstraint() {
        stackView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(24)
            make.centerY.equalToSuperview().offset(-30)
        }
        startButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(8)
            make.height.equalTo(48)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(57)
        }
    }
}

