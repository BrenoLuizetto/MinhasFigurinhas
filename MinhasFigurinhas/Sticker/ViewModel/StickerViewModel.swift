//
//  StickerViewModel.swift
//  MinhasFigurinhas
//
//  Created by Breno Luizetto on 23/08/22.
//

import Foundation

protocol StickerViewModelProtocol {
    var list: [StickerList]? { get }
    var countryName: String { get }
    var key: String { get }
}

class StickerViewModel: StickerViewModelProtocol {
    
    var list: [StickerList]?
    var countryName: String
    var key: String
    
    init(countryName: String,
         key: String) {
        self.countryName = countryName
        self.key = key
        self.list = StickerHelper.getList(name: countryName,
                                        key: key,
                                        listType: .acquired)
    }
    
}
