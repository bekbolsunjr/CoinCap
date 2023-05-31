import UIKit
import RxFlow

enum MainStep: Step {
    case main
    case detail(item: SectionOfData.Item)
}

internal class MainFlow: Flow {
    internal var root: Presentable {
        return self.rootViewController
    }
    
    internal let rootViewController: UINavigationController
    
    internal init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
        rootViewController.setNavigationBarHidden(false, animated: true)
    }
    
    internal func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? MainStep else { return .none }
        
        switch step {
        case .main:
            return navigateToMainScreen()
        case .detail (let item):
            return navigateToDetailScreen(item: item)
        }
    }
    
    private func navigateToMainScreen() -> FlowContributors {
        let mainController: MainController = .init()
        rootViewController.viewControllers = [mainController]
        
        return .one(flowContributor: .contribute(withNextPresentable: mainController, withNextStepper: mainController.viewModel))
    }
    
    private func navigateToDetailScreen(item: SectionOfData.Item) -> FlowContributors {
        let detailController: DetailController = .init()
        let viewmodel = Swinjectable.container.resolve(DetailViewModel.self, argument: item)!
        detailController.viewModel = viewmodel
        rootViewController.pushViewController(detailController, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: detailController, withNextStepper: detailController.viewModel))
    }
}
