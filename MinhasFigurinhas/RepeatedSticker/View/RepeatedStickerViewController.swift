//
//  RepetedStickerViewController.swift
//  MinhasFigurinhas
//
//  Created by Breno Luizetto on 25/08/22.
//

import Foundation
import UIKit

class RepeatedStickerViewController: BaseViewController {
    
    private lazy var tableView = StickerTableView()
    
    private var viewModel = RepeatedStickerViewModel()
    
    override func loadView() {
        super.loadView()
        
        self.view = tableView
        configNavBar()
    }
    
    override func viewDidLoad() {
        tableView.setData(dataSource: self,
                          delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateData()
    }
    
    func configNavBar() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add,
                                        target: self,
                                        action: #selector(addAction))
        let shareButton = UIBarButtonItem(barButtonSystemItem: .action,
                                          target: self,
                                          action: #selector(shareOnlyText))
        self.navigationItem.rightBarButtonItems = [addButton, shareButton]

        self.title = "Minhas Repetidas"

    }
    
    @objc
    private func addAction() {
        let countriesViewModel = CountriesViewModel(key: "Repeated",
                                               title: "Adicionar Repitidas")
        let countriesVC = CountriesViewController(viewModel: countriesViewModel)

        self.navigationController?.pushViewController(countriesVC,
                                                      animated: true)
    }
    
    @objc
    private func shareOnlyText() {
        let textShare = viewModel.shareRepeatedStickers()
        let activityViewController = UIActivityViewController(activityItems: textShare , applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    private func updateData() {
        viewModel.setData()
        tableView.reloadWithTransition()
    }
    
}

extension RepeatedStickerViewController: UITableViewDataSource,
                                         UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.list?.count ?? 0
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return  CountryHelper.getName(value: viewModel.list?[section].name ?? "")
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let items = viewModel.list?[section].items
        return items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StickerTableViewCell",
                                                       for: indexPath) as? StickerTableViewCell,
              let item = viewModel.list?[indexPath.section].items[indexPath.row] else { return UITableViewCell() }
        
        let data = StickerViewData(name: item.name,
                                   index: item.index,
                                   imagePath: item.imagePath,
                                   hasSticker: item.hasSticker,
                                   isRepeated: true)
        cell.setup(viewData: data,
                   delegate: self)
        return cell
    }
}

extension RepeatedStickerViewController: StickerCellDelegate {
    func didTapPossesButton(name: String,
                            index: Int,
                            completion: @escaping ((Bool) -> Void)) {
        let hasSticker = StickerHelper.updateSticker(key: name + "Repeated",
                                  index: index)
        updateData()
        completion(hasSticker)
    }
}
