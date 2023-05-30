import Foundation
import Swinject
import Moya

internal final class ServiceAssembly: Assembly {
    internal func assemble(container: Container) {
        container.autoregister(
            MainRepository.self,
            initializer: MainRepositoryImpl.init
        )
        
        container.register(MoyaProvider<CoinCapAPI>.self) { _ in
            return .init(plugins: [])
        }
    }
}
