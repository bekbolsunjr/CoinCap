import RxSwift
import RxCocoa
import Action
import Foundation
import RxFlow

internal enum DetailViewModelContract {
    internal struct Input {}
    
    internal struct Output {
        let name: Driver<String>
        let priceUsd: Driver<String>
        let changePercent24Hr: Driver<String>
        let marketCapUsd: Driver<String>
        let supply: Driver<String>
        let volumeUsd24Hr: Driver<String>
        let disposables: [Disposable]
        
        
    }
}

protocol DetailViewModel: Stepper {
    typealias Input = DetailViewModelContract.Input
    typealias Output = DetailViewModelContract.Output
    func transform(input: Input) -> Output
}

internal class DetailViewModelImpl: Stepper {
    var steps: PublishRelay<Step> = .init()
    var items: BehaviorRelay<SectionOfData.Item> = .init(value: User())
    var disposeBag: DisposeBag = .init()
    
    init(item: SectionOfData.Item) {
        items.accept(item)
    }
}

extension DetailViewModelImpl: DetailViewModel {
    internal func transform(input: Input) -> Output {
        let disposables: [Disposable] = []
        
        return Output(
            name: items.asDriver().map {$0.name!},
            priceUsd: items.asDriver().map {String($0.priceUsd!.prefix(8))},
            changePercent24Hr: items.asDriver().map {$0.changePercent24Hr!},
            marketCapUsd: items.asDriver().map {String($0.marketCapUsd!.prefix(6))},
            supply: items.asDriver().map {String($0.supply!.prefix(5))},
            volumeUsd24Hr: items.asDriver().map {String($0.volumeUsd24Hr!.prefix(4))},
            disposables: disposables)
    }
}
