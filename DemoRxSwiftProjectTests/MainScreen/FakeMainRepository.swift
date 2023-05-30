@testable import DemoRxSwiftProject
import Foundation
import RxSwift
import Nimble

final class FakeMainRepository: MainRepository {
    let bundle: Bundle
    init(bundle: Bundle) {
        self.bundle = bundle
    }
    func getData() -> RxSwift.Single<[DemoRxSwiftProject.SectionOfData.Item]> {
        return .just(loadModelFromFile(name: "fakeUsers"))
    }
    
    internal func loadModelFromFile(name: String) -> [User] {
        guard let path = bundle.path(forResource: name, ofType: "json") else { return [] }
        
        do {
            let data = try Data(contentsOf: URL(filePath: path), options: .mappedIfSafe)
            let users = try JSONDecoder().decode(UsersResponse.self, from: data)
            
            return users.data
        } catch {
            print(error.localizedDescription)
        }
        return []
    }
}
