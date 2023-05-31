@testable import DemoRxSwiftProject
import RxSwift
import XCTest
import Nimble
import RxCocoa

final class MainViewModelTest: XCTestCase {
    private var viewModel: MainViewModel!
    private var disposeBag: DisposeBag!
    
    override func setUp() {
        let repository = FakeMainRepository(bundle: Bundle(for: Self.self))
        viewModel = MainViewModelImpl(repository: repository)
        disposeBag = .init()
    }
    
    override func tearDown() {
        viewModel = nil
        disposeBag = nil
    }
    
    func test_whenItemIsSelected() {
        let users: PublishRelay<User> = .init()
        let output = createOutput(model: users)
        let modelSelected: SectionOfData.Item = .init(id: 1, email: "", firstName: "", lastName: "", avatar: "")
        
        disposeBag.insert(output.disposables)
        viewModel.steps.subscribe(onNext: { step in
            expect(step).to(beAnInstanceOf(MainStep.self))
            switch step as? MainStep {
            case .detail(let newItem):
                expect(newItem).to(equal(modelSelected))
            default: XCTFail("Step does not match to office map")
            }
        }).disposed(by: disposeBag)

        users.accept(modelSelected)
    }
    
    private func createOutput(model: PublishRelay<User>) -> MainViewModelContract.Output {
        let user: User = .init(id: 0, email: "", firstName: "", lastName: "", avatar: "")
        let input: MainViewModelContract.Input = .init(modelSelected: model.asDriver(onErrorJustReturn: user))
        return viewModel.transform(input: input)
    }
}
