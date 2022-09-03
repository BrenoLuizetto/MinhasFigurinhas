//
//  HomeCollectionView.swift
//  MinhasFigurinhas
//
//  Created by Breno Luizetto on 22/08/22.
//

import Foundation
import UIKit

class HomeCollectionView: UICollectionView {
    
    func setData(dataSource: UICollectionViewDataSource,
                 delegate: UICollectionViewDelegate) {
        self.backgroundColor = .clear
        self.register(HomeCollectionViewCell.self,
                      forCellWithReuseIdentifier: "HomeCollectionViewCell")
        self.register(HomeCollectionHeaderView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: "headerView")

        self.dataSource = dataSource
        self.delegate = delegate
        self.reloadData()
    }
    
}

