@testable import DemoRxSwiftProject
import XCTest
import SnapshotTesting
import RxSwift


final class DetailControllerTest: XCTestCase {
    
    private var controller: DetailController!
    
    override func setUp() {
        super.setUp()
        controller = .init()
        let item: User = .init(id: 1, email: "test@mail.ru", firstName: "Boo", lastName: "Foo", avatar: "")
        controller.viewModel = DetailViewModelImpl.init(item: item)
    }
    
    override func tearDown() {
        super.tearDown()
        controller = nil
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
