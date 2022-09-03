//
//  HomeVIew.swift
//  MinhasFigurinhas
//
//  Created by Breno Luizetto on 22/08/22.
//

import Foundation
import UIKit

class HomeView: UIView {
    
    private lazy var container: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .fill
        view.spacing = 15
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var layout: UICollectionViewFlowLayout = {
       let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: CGFloat(150),
                                 height: CGFloat(200))
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 25
        layout.headerReferenceSize = CGSize(width: self.frame.width,
                                            height: 100)
        return layout
    }()
    
    lazy var homeCollection = HomeCollectionView(frame: .zero,
                                                 collectionViewLayout: layout)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViewConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(dataSource: UICollectionViewDataSource,
                 delegate: UICollectionViewDelegate) {
        homeCollection.setData(dataSource: dataSource,
                               delegate: delegate)
    }
    
    func updateData() {
        homeCollection.reloadData()
    }
}

extension HomeView: ViewConfiguration {
    
    func buildViewHierarchy() {
        self.addSubview(container)
        container.addArrangedSubview(homeCollection)
    }
    
    func makeConstraints() {
        container.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.left.equalToSuperview().offset(12)
            make.right.bottom.equalToSuperview().offset(-12)
        }
    }
    
    func configElements() {
        self.backgroundColor = .black
    }
    
}
