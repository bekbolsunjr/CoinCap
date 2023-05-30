//import RxSwift
//import RxCocoa
//import Foundation
//
//extension MainDataSource: HasDelegate {
//    typealias Delegate = MainDataSourceDelegate
//}
//
//@objc protocol MainDataSourceDelegate: AnyObject {
//    @objc optional func tap(indexPAth: IndexPath)
//}
//
//internal final class MainDataSourceDelegateProxy: DelegateProxy<MainDataSource,
//                                                  MainDataSourceDelegate>,
//                                                  DelegateProxyType,
//                                                  MainDataSourceDelegate {
//    
//    internal init(datasource: MainDataSource) {
//        super.init(parentObject: datasource,
//                   delegateProxy: MainDataSourceDelegateProxy.self)
//    }
//    
//    internal static func registerKnownImplementations() {
//        self.register { parent in
//            MainDataSourceDelegateProxy(datasource: parent)
//        }
//    }
//}
//
//extension Reactive where Base: MainDataSource {
//    internal var delegate: DelegateProxy<MainDataSource, MainDataSourceDelegate> {
//        return MainDataSourceDelegateProxy.proxy(for: base)
//    }
//    
//    internal var itemSelected: ControlEvent<IndexPath> {
//        let sourse = delegate.methodInvoked(
//            #selector(MainDataSourceDelegate.tap(indexPAth:)))
//            .map { $0.first as! IndexPath }
//        
//        return ControlEvent(events: sourse)
//    }
//}
