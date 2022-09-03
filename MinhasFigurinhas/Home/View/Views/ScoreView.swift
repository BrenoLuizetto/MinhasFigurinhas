//
//  ScoreView.swift
//  MinhasFigurinhas
//
//  Created by Breno Luizetto on 29/08/22.
//

import Foundation
import UIKit

class ScoreView: UIView {
    
    private lazy var container: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .center
        view.distribution = .fillProportionally
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.textAlignment = .center
        return lbl
    }()
    
    private lazy var scoreLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.layer.borderWidth = 1
        lbl.layer.borderColor = UIColor.white.cgColor
        return lbl
    }()
    
    func setup(title: String,
               score: String) {
        self.titleLabel.text = title
        self.scoreLabel.text = score
        
        self.setupViewConfiguration()
    }

}

extension ScoreView: ViewConfiguration {
    func buildViewHierarchy() {
        self.addSubview(container)
        container.addArrangedSubview(titleLabel)
        container.addArrangedSubview(scoreLabel)
    }
    
    func makeConstraints() {
        container.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-16)
            make.height.equalTo(200)
            make.width.equalTo(100)
        }
        
        scoreLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(16)
            make.bottom.right.equalToSuperview().offset(-16)
        }
        
    }
}
