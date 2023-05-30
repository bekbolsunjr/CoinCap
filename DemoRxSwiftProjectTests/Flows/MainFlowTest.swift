import XCTest
import SnapshotTesting
@testable import DemoRxSwiftProject
import RxSwift
import RxFlow
import Nimble

final class MainFlowTest: XCTestCase {
    
    private var sut: MainFlow = .init(rootViewController: UINavigationController())
    
    func test_whenNavigateToMain() {
        let step: Step = MainStep.main
        let flowContributors = sut.navigate(to: step)

        if case .one(let flowContributor) = flowContributors,
           case .contribute(let withNextPresentable, let withNextStepper, _, _) = flowContributor {
            expect(withNextPresentable).to(beAnInstanceOf(MainController.self))
            expect(withNextStepper).to(beAKindOf(MainViewModel.self))
        }
    }
    
    func test_whenNavigateToDetail() {
        let item: SectionOfData.Item = .init(id: 1,
                                             email: "",
                                             firstName: "",
                                             lastName: "",
                                             avatar: "")
        let step: Step = MainStep.detail(item: item)
        
        let flowContributors = sut.navigate(to: step)

        if case .one(let flowContributor) = flowContributors,
           case .contribute(let withNextPresentable, let withNextStepper, _, _) = flowContributor {
            expect(withNextPresentable).to(beAnInstanceOf(DetailController.self))
            expect(withNextStepper).to(beAKindOf(DetailViewModel.self))
        }
    }
}
