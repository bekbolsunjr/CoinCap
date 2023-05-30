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
            priceUsd: items.asDriver().map {$0.priceUsd!},
            changePercent24Hr: items.asDriver().map {$0.changePercent24Hr!},
            marketCapUsd: items.asDriver().map {$0.marketCapUsd!},
            supply: items.asDriver().map {$0.supply!},
            volumeUsd24Hr: items.asDriver().map {$0.volumeUsd24Hr!},
            //avatarURLString: items.asDriver().map {URL(string: $0.avatar)},
            disposables: disposables)
    }
}
