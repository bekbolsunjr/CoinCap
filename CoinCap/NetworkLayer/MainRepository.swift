import Foundation
import RxSwift
import Moya

protocol MainRepository {
    func getData() -> Single<[SectionOfData.Item]>
}

internal final class MainRepositoryImpl {
    internal var provider: MoyaProvider<CoinCapAPI>
    
    internal init(provider: MoyaProvider<CoinCapAPI>) {
        self.provider = provider
    }
}

extension MainRepositoryImpl: MainRepository {
    internal func getData() -> Single<[SectionOfData.Item]> {
        return provider.rx.request(.assets)
            .map { response in
                let userResponse = try response.map(UsersResponse.self,
                                                    using: JSONDecoder())
                return userResponse.data
            }
            .observe(on: MainScheduler.instance)
            
    }
}
