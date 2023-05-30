import UIKit

class DetailController: VMController<DetailPresentable,
                                DetailViewModel> {

    internal override func onConfigureViewModel() {
        let input: DetailViewModel.Input = .init()
        let output = viewModel.transform(input: input)
        disposableBag.insert([
            output.name.drive(content.name.rx.text),
            output.priceUsd.drive(content.priceUsd.rx.text),
            output.changePercent24Hr.drive(content.changePercent24Hr.rx.text),
            output.marketCapUsd.drive(content.marketCapUsd.rx.text)
            //output.avatarURLString.drive(content.imageView.rx.url)
        ])
    }
}
