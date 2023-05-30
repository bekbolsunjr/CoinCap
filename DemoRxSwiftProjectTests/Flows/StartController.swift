@testable import DemoRxSwiftProject
import XCTest
import SnapshotTesting
import RxSwift


final class StartControllerTest: XCTestCase {
    
    private var controller: StartController!
    
    override func setUp() {
        super.setUp()
        controller = .init()
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
