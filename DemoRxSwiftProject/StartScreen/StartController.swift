import UIKit

internal final class StartController: VMController<StartPresentable,
                                StartViewModel> {

    internal override func onConfigureViewModel() {
        let input = StartViewModel.Input(startTrigget: content.startButton.rx.tap.asDriver())
        let output = viewModel.transform(input: input)
        
        disposableBag.insert(output.disposables)
    }
}
