import RxDataSources
import Foundation

internal struct SectionOfData {
    internal var items: [Item]
}
extension SectionOfData: SectionModelType {
    typealias Item = User
    init(original: SectionOfData, items: [Item]) {
        self = original
        self.items = items
    }
}

internal final class MainDataSource: RxTableViewSectionedReloadDataSource<SectionOfData> {
    
    internal convenience init() {
        self.init(configureCell: { _, _, _, _ in .init() })
        configureDataSource()
    }
    
    private func configureDataSource() {
        self.configureCell = { [weak self] dataSource, tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: MainCell.identifier, for: indexPath) as! MainCell
            cell.configureCell(name: item.name ?? "", costUSD: item.priceUsd ?? "", symbol: item.symbol ?? "")
            return cell
        }
    }
}
