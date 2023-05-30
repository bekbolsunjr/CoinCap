import RxSwift
import RxCocoa
import Action
import Foundation
import RxFlow

internal enum StartViewModelContract {
    internal struct Input {
        var startTrigget: Driver<Void>
    }

    internal struct Output {
        let disposables: [Disposable]
    }
}

protocol StartViewModel: Stepper {
    typealias Input = StartViewModelContract.Input
    typealias Output = StartViewModelContract.Output
    func transform(input: Input) -> Output
}

internal class StartViewModelImpl: Stepper {
    
    internal var steps: PublishRelay<Step> = .init()
    internal var disposeBag: DisposeBag = .init()
    
    internal lazy var startAction: CocoaAction = .init { [unowned self] in
        self.steps.accept(AppStep.main)
        return .just(())
    }
}

extension StartViewModelImpl: StartViewModel {
   internal  func transform(input: Input) -> Output {
        let disposables: [Disposable] = [
            input.startTrigget.drive(startAction.inputs)]
        
        return Output(disposables: disposables)
    }
}

