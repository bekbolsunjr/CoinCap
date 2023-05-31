import UIKit
import RxCocoa
import RxDataSources

internal final class MainController: VMController<MainPresentable,
                                MainViewModel> {
    private lazy var dataSource: MainDataSource = .init()
    
    let searchBar = UISearchBar()
    
    internal override func onConfigureController() {
        self.title = "Trending Coins"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search,
                                                                 target: self,
                                                                 action: #selector(showSerchBar))
        
    }
    
    @objc func showSerchBar() {
        navigationItem.titleView = searchBar
        searchBar.showsCancelButton = true
        navigationItem.rightBarButtonItem = nil
        searchBar.becomeFirstResponder()
    }

    internal override func onConfigureViewModel() {
        let input = MainViewModel.Input(
            modelSelected: content.tableView.rx.modelSelected(SectionOfData.Item.self).asDriver(),
            addTrigger: .never())

        let output = viewModel.transform(input: input)
        disposableBag.insert([
            output.items.drive(content.tableView.rx.items(dataSource: dataSource)),
            output.isEdit.drive(rx.isEditing)
        ])
    }
}
