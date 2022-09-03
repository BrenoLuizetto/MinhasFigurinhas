//
//  StickerViewController.swift
//  MinhasFigurinhas
//
//  Created by Breno Luizetto on 23/08/22.
//

import Foundation
import UIKit

class StickerViewController: BaseViewController {
    
    //MARK: - Properties
    private var viewModel: StickerViewModelProtocol
    private lazy var tableView = StickerTableView()
    
    //MARK: - Constructors
    init(viewModel: StickerViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
    //MARK: -LifeCycle
    
    override func loadView() {
        super.loadView()
        self.view = tableView
    }
    
    override func viewDidLoad() {
        tableView.setData(dataSource: self,
                          delegate: self)
        
        self.title = CountryHelper.getName(value: viewModel.countryName)

    }

}

//MARK: - TableView Delegate & DataSource
extension StickerViewController: UITableViewDataSource,
                                 UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.list?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StickerTableViewCell",
                                                       for: indexPath) as? StickerTableViewCell,
              let item = viewModel.list?[indexPath.row] else { return UITableViewCell() }
        
        let data = StickerViewData(name: item.name,
                                   index: item.index,
                                   imagePath: item.imagePath,
                                   hasSticker: item.hasSticker)
        cell.setup(viewData: data,
                   delegate: self)
        return cell
    }
}

//MARK: - UIScrollViewDelegate
extension StickerViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.view?.endEditing(true)
    }
}

//MARK: - StickerCellDelegate
extension StickerViewController: StickerCellDelegate {
    func didTapPossesButton(name: String,
                            index: Int,
                            completion: @escaping ((Bool) -> Void)) {
        let hasSticker = StickerHelper.updateSticker(key: name + viewModel.key,
                                  index: index)
        completion(hasSticker)
    }
}
