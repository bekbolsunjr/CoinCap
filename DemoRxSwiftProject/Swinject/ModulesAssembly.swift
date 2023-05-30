import Foundation
import Swinject

internal final class ModulesAssembly: Assembly {
    internal func assemble(container: Container) {
        container.autoregister(
            StartViewModel.self,
            initializer: StartViewModelImpl.init
        )

        container.autoregister(
            MainViewModel.self,
            initializer: MainViewModelImpl.init
        )

        container.autoregister(
            DetailViewModel.self,
            argument: SectionOfData.Item.self,
            initializer: DetailViewModelImpl.init
        )
    }
}
