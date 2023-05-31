import RxSwift
import RxCocoa
import Action
import Foundation
import RxFlow

internal enum MainViewModelContract {
    internal struct Input {
        var modelSelected: Driver<SectionOfData.Item>
        var addTrigger: Driver<Void>
    }
    
    internal struct Output {
        var items: Driver<[SectionOfData]>
        var isEdit: Driver<Bool>
        let disposables: [Disposable]
    }
}

protocol MainViewModel: Stepper {
    typealias Input = MainViewModelContract.Input
    typealias Output = MainViewModelContract.Output
    func transform(input: Input) -> Output
}

internal class MainViewModelImpl: Stepper {
    
    private let repository: MainRepository
    
    internal var steps: PublishRelay<Step> = .init()
    internal var isEdit: BehaviorRelay<Bool> = .init(value: false)
    internal var users: BehaviorRelay<[SectionOfData]> = .init(value: [])
    internal var disposeBag: DisposeBag = .init()
    
    lazy var itemSelectedAction: Action<SectionOfData.Item, Void> = .init { [unowned self] item in
            return .just(self.steps.accept(MainStep.detail(item: item)))
    }
    
    lazy var changeStatus: CocoaAction = .init { [unowned self] in
        let status = !isEdit.value
        isEdit.accept(status)
        return .just(())
    }
    
    internal init(repository: MainRepository) {
        self.repository = repository
        
        repository.getData().subscribe { [weak self] in
            self?.users.accept([SectionOfData(items: $0)])
        }.disposed(by: disposeBag)
    }
}

extension MainViewModelImpl: MainViewModel {
    internal func transform(input: Input) -> Output {
        let disposables: [Disposable] = [
            input.modelSelected.drive(itemSelectedAction.inputs),
            input.addTrigger.drive(changeStatus.inputs)
        ]
 
        return Output(
            items: users.asDriver(),
            isEdit: isEdit.asDriver(),
            disposables: disposables)
    }
}
