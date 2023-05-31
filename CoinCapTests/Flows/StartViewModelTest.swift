@testable import DemoRxSwiftProject
import RxSwift
import XCTest
import Nimble
import RxCocoa

final class StartViewModelTest: XCTestCase {
    private var viewModel: StartViewModel!
    private var disposeBag: DisposeBag!
    
    override func setUp() {
        viewModel = StartViewModelImpl.init()
        disposeBag = .init()
    }
    
    override func tearDown() {
        viewModel = nil
        disposeBag = nil
    }
    
    func test_whenItemIsSelected() {
        let trigger: PublishRelay<Void> = .init()
        let output = createOutput(trigger: trigger)
        
        disposeBag.insert(output.disposables)
        viewModel.steps.subscribe(onNext: { step in
            expect(step).to(beAnInstanceOf(AppStep.self))
            switch step as? AppStep {
            case .main: XCTAssert(true)
            default: XCTFail("Step does not match to office map")
            }
        }).disposed(by: disposeBag)

        trigger.accept(())
    }
    
    private func createOutput(trigger: PublishRelay<Void>) -> StartViewModelContract.Output {
        let input: StartViewModelContract.Input = .init(startTrigget: trigger.asDriver(onErrorJustReturn: ()))
        return viewModel.transform(input: input)
    }
}

