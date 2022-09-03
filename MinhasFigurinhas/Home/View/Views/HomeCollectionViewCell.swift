//
//  HomeCollectionViewCell.swift
//  MinhasFigurinhas
//
//  Created by Breno Luizetto on 22/08/22.
//

import Foundation
import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    private lazy var container: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var countryImageView: UIImageView = {
       let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    private lazy var divider: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.text = "Name"
        lbl.textAlignment = .center
        return lbl
    }()
    
    func setup(countryImage: UIImage,
               countryName: String) {
        self.countryImageView.image = countryImage
        self.nameLabel.text = CountryHelper.getName(value: countryName)
        
        setupViewConfiguration()
    }
}

extension HomeCollectionViewCell: ViewConfiguration {
    func buildViewHierarchy() {
        self.addSubview(container)
        container.addSubview(countryImageView)
        container.addSubview(nameLabel)
        container.addSubview(divider)
    }
    
    func makeConstraints() {
        
        container.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        countryImageView.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(150)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(countryImageView.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(divider.snp.top).offset(5)
        }
        
        divider.snp.makeConstraints { make in
            make.left.bottom.right.equalToSuperview()
            make.height.equalTo(1)
        }
    }
    
    func configElements() {
        
        self.backgroundColor = .clear
    }
}
