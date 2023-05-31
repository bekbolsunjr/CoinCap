@testable import DemoRxSwiftProject
import XCTest
import SnapshotTesting
import RxFlow
import Swinject
import Nimble



final class AppFlowTest: XCTestCase {
    
    private var sut: AppFlow = .init()
    
    func test_whenNavigateToStart() {
        let step: Step = AppStep.start
        let flowContributors = sut.navigate(to: step)

        if case .one(let flowContributor) = flowContributors,
           case .contribute(let withNextPresentable, let withNextStepper, _, _) = flowContributor {
            expect(withNextPresentable).to(beAnInstanceOf(StartController.self))
            expect(withNextStepper).to(beAKindOf(StartViewModel.self))
        }
    }
    
    func test_whenNavigateToMain() {
        let step: Step = AppStep.main
        let flowContributors = sut.navigate(to: step)

        if case .one(let flowContributor) = flowContributors,
           case .contribute(let withNextPresentable, let withNextStepper, _, _) = flowContributor {
            expect(withNextPresentable).to(beAnInstanceOf(MainFlow.self))
            expect(withNextStepper).to(beAKindOf(OneStepper.self))
        }
    }
}
