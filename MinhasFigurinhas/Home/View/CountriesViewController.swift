//
//  MainViewController.swift
//  MinhasFigurinhas
//
//  Created by Breno Luizetto on 22/08/22.
//

import Foundation
import UIKit

class CountriesViewController: UIViewController {
    
    private let viewModel: CountriesViewModelProtocol
    
    private lazy var homeView = HomeView()
    
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController()
        searchController.searchBar.barStyle = .black
        searchController.searchBar.isUserInteractionEnabled = true
        searchController.searchBar.backgroundColor = .clear
        searchController.searchBar.placeholder = "Digite a seleção desejada"
        searchController.searchBar.isTranslucent = true
        searchController.searchBar.searchBarStyle = .minimal
        searchController.searchBar.sizeToFit()
        searchController.searchBar.placeholder = "Digite a seleção desejada"
        searchController.searchBar.delegate = self
        return searchController
    }()
    
    init(viewModel: CountriesViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil,
                   bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        setData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        homeView.updateData()
    }
    
    override func loadView() {
        super.loadView()
        self.view = homeView
        configNavBar()
        navigationItem.searchController = searchController
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        homeView.endEditing(true)
    }
    
    func setData() {
        homeView.setData(dataSource: self,
                         delegate: self)
    }
    
    @objc
    private func shareOnlyText() {
        let textShare = viewModel.getNeededStickers()
        let activityViewController = UIActivityViewController(activityItems: textShare , applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    
    
    func configNavBar() {
        let shareButton = UIBarButtonItem(barButtonSystemItem: .action,
                                          target: self,
                                          action: #selector(shareOnlyText))
        self.navigationItem.rightBarButtonItems = [shareButton]
        self.title = viewModel.title
    }
}

extension CountriesViewController: UICollectionViewDelegate,
                                   UICollectionViewDataSource,
                                   UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.list?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell",
                                                            for: indexPath) as? HomeCollectionViewCell,
              let image = viewModel.list?[indexPath.row].teamShield,
              let name = viewModel.list?[indexPath.row].name
        else { return UICollectionViewCell() }
        
        cell.setup(countryImage: image,
                    countryName: name)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let countryName = viewModel.list?[indexPath.row].name else { return }
        let stickerViewModel = StickerViewModel(countryName: countryName,
                                                key: viewModel.key)
        let vc = StickerViewController(viewModel: stickerViewModel)
        
        self.navigationController?.pushViewController(vc,
                                                      animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {

        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerView", for: indexPath) as? HomeCollectionHeaderView else { return UICollectionReusableView() }

            reusableview.setup(acquiredScore: "\(viewModel.getStickersCount(key: "acquired"))",
                               neededScore:  "\(viewModel.getStickersCount(key: "needed"))",
                               repeatedScore: "\(viewModel.getStickersCount(key: "repeated"))")
                return reusableview


        default:  fatalError("Unexpected element kind")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
           return CGSize(width: collectionView.frame.width, height: 100) //add your height here
       }
    
}

extension CountriesViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.view?.endEditing(true)
    }
}

extension CountriesViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
}
