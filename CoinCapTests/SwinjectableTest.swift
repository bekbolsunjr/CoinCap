import XCTest
import Swinject
import SwinjectAutoregistration
import Nimble

@testable import CoinCap

class SwinjectableTests: XCTestCase {
    
    // Test that the Swinjectable container is not nil
    func testContainerNotNil() {
        expect(Swinjectable.container).toNot(beNil())
    }
    
    // Test that the Swinjectable assembler is not nil
    func testAssemblerNotNil() {
        expect(Swinjectable.assembler).toNot(beNil())
    }
    
    // Test that the Swinjectable container and assembler are the same instance
    func testContainerAndAssemblerSameInstance() {
        expect(Swinjectable.container === Swinjectable.assembler.resolver as? Container).to(beTrue())
    }
    
    // Test that the Swinjectable container is the same as the Container's container
    func testStaticContainerSameAsSwinjectableContainer() {
        expect(Container.container === Swinjectable.container).to(beTrue())
    }
    
    // Test that an assembly can be assembled into the Swinjectable container
    func testAssembleAssembly() {
        let container = Swinjectable.container
        let assembly = MyAssembly()
        container.assemble(assembly: assembly)
        expect(container.resolve(MyService.self)).toNot(beNil())
    }
}

// Example assembly to be used in the test
private class MyAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(MyService.self, initializer: MyService.init)
    }
}

// Example service to be used in the test
private class MyService {
    init() {}
}
