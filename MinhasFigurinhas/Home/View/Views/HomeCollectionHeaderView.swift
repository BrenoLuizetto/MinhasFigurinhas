//
//  HomeCollectionHeaderView.swift
//  MinhasFigurinhas
//
//  Created by Breno Luizetto on 29/08/22.
//

import Foundation
import UIKit

class HomeCollectionHeaderView: UICollectionReusableView {
    
    private lazy var container: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.alignment = .trailing
        view.distribution = .equalSpacing
        view.spacing = 16
        return view
    }()
    
    private lazy var acquiredView: ScoreView = {
        let view = ScoreView()
        return view
    }()
    
    private lazy var neededView: ScoreView = {
        let view = ScoreView()
        return view
    }()
    
    private lazy var repeatedView: ScoreView = {
        let view = ScoreView()
        return view
    }()
    
    func setup(acquiredScore: String,
               neededScore: String,
               repeatedScore: String) {
        self.acquiredView.setup(title: "Tenho",score: acquiredScore)
        self.neededView.setup(title: "Faltam", score: neededScore)
        self.repeatedView.setup(title: "Repetidas", score: repeatedScore)
        
        setupViewConfiguration()
    }
    
}

extension HomeCollectionHeaderView: ViewConfiguration {
    func buildViewHierarchy() {
        addSubview(container)
        container.addArrangedSubview(acquiredView)
        container.addArrangedSubview(neededView)
        container.addArrangedSubview(repeatedView)
    }
    
    func makeConstraints() {
        container.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-16)
        }
    }
}
