//
//  ViewConfiguration.swift
//  MinhasFigurinhas
//
//  Created by Breno Luizetto on 22/08/22.
//

import SnapKit

protocol ViewConfiguration: AnyObject {
    func buildViewHierarchy()
    func makeConstraints()
    func configElements()
    func setupViewConfiguration()
}

extension ViewConfiguration {
    func setupViewConfiguration() {
        buildViewHierarchy()
        makeConstraints()
        configElements()
    }
    
    func configElements() {
        // Not Implemented
    }
}
