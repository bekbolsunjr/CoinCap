@testable import DemoRxSwiftProject
import XCTest
import SnapshotTesting
import RxSwift


final class MainControllerTest: XCTestCase {
    
    private var controller: MainController!
    private var repository: MainRepository!
    
    override func setUp() {
        super.setUp()
        controller = .init()
        repository = FakeMainRepository(bundle: Bundle(for: Self.self))
        controller.viewModel = MainViewModelImpl.init(repository: repository)
    }
    
    override func tearDown() {
        super.tearDown()
        controller = nil
        repository = nil
    }
    
    func test_viewController() {
        assertSnapshots(
            matching: controller,
            as: [
                .image(on: .iPhoneSe),
                .image(on: .iPhone8),
                .image(on: .iPhone8Plus),
                .image(on: .iPhoneX),
            ])
    }
}
