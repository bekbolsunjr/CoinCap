import Foundation
import RxSwift
import Moya



enum CoinCapAPI {
    case assets
}

extension CoinCapAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.coincap.io/v2")!
    }

    var path: String {
        switch self {
        case .assets:
            return "/assets"
        }
    }

    var method: Moya.Method {
        return .get
    }

    var sampleData: Data {
        return Data() // You can provide sample data for testing if needed
    }

    var task: Task {
        return .requestPlain
    }

    var headers: [String: String]? {
        return nil // You can specify any additional headers if required
    }
}


//internal enum MainTargetType: TargetType {
//
//    internal var baseURL: URL { return URL(string: "https://reqres.in")! }
//    case getAllUser(page: String)
//
//    internal var path: String {
//        switch self {
//        case .getAllUser(_):
//            return "/api/users"
//        }
//    }
//
//    internal var method: Moya.Method {
//        switch self {
//        case .getAllUser:
//            return .get
//        }
//    }
//
//    internal var task: Task {
//        switch self {
//        case .getAllUser(let pageNo):
//            return .requestParameters(parameters: ["page": pageNo], encoding: URLEncoding.default)
//        }
//    }
//
//    internal var sampleData: Data { .init() }
//
//    internal var headers: [String : String]? {
//        switch self {
//        case .getAllUser:
//            return ["Accept":"application/json",
//                    "Content-type":"application/json"]
//        }
//    }
//}
