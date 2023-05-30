import UIKit
import RxFlow
import RxSwift
import RxCocoa

@main
internal final class AppDelegate: UIResponder, UIApplicationDelegate {

    private let disposeBag = DisposeBag()
    private var coordinator = FlowCoordinator()
    internal var window: UIWindow?
    private lazy var services: [UIApplicationDelegate] = [
        SwinjectServices()
    ]

    internal func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        guard let window = self.window else { return false }
        
        services.lazy.forEach {
            _ = $0.application?(application, didFinishLaunchingWithOptions: launchOptions)
        }
        
        coordinator.rx.willNavigate.subscribe(onNext: { (flow, step) in
            debugPrint("RxFlow will navigate to flow=\(flow) and step=\(step)")
        }).disposed(by: disposeBag)
        
        coordinator.rx.didNavigate.subscribe(onNext: { (flow, step) in
            debugPrint("RxFlow did navigate to flow=\(flow) and step=\(step)")
        }).disposed(by: disposeBag)
        
        let appFlow = AppFlow()

        coordinator.coordinate(flow: appFlow, with: AppStepper())

        Flows.use(appFlow, when: .created) { root in
            window.rootViewController = root
            window.makeKeyAndVisible()
        }

        return true
    }
}

