import UIKit
import RxFlow
import RxSwift
import RxCocoa

public enum AppStep: Step {
    case start
    case main
}

public final class AppFlow: Flow {
    public var root: Presentable {
        return self.rootViewController
    }

    internal lazy var rootViewController: UINavigationController = {
        let viewController = UINavigationController()
        viewController.setNavigationBarHidden(true, animated: false)
        return viewController
    }()

    public func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppStep else { return .none }
        
        switch step {
        case .start:
            return navigateToStartScreen()
        case .main:
            return navigateToMainScreen()
        }
    }
    
    private func navigateToStartScreen() -> FlowContributors {
        let startController: StartController = .init()
        rootViewController.viewControllers = [startController]
        return .one(flowContributor: .contribute(withNextPresentable: startController, withNextStepper: startController.viewModel))
    }
    
    private func navigateToMainScreen() -> FlowContributors {
        let mainFlow: MainFlow = .init(rootViewController: rootViewController)
        return .one(flowContributor: .contribute(withNextPresentable: mainFlow, withNextStepper: OneStepper(withSingleStep: MainStep.main)))
    }

}

public final class AppStepper: Stepper {

    public let steps = PublishRelay<Step>()
    private let disposeBag = DisposeBag()
    
    public var initialStep: Step {
        return AppStep.start
    }

    public func trigger(_ step: Step) {
        steps.accept(step)
    }
}
