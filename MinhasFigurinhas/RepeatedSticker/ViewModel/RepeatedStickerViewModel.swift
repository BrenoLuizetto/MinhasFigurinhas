//
//  RepeatedStickerViewModel.swift
//  MinhasFigurinhas
//
//  Created by Breno Luizetto on 25/08/22.
//

import Foundation

protocol RepeatedStickerViewProtocol {
    
    var list: [Category]? { get }
    var countries: [CountryModel]? { get }
    
    func shareRepeatedStickers() -> [String]
}

class RepeatedStickerViewModel: RepeatedStickerViewProtocol {
    
    var list: [Category]?
    
    var countries: [CountryModel]?
    

    func setData() {
        countries = CountryListMock.getList()
        list = []
        if let countries = countries {
            for country in countries {
                let items = StickerHelper.getList(name: country.name,
                                                key: "Repeated",
                                                listType: .repeated)
                if !items.isEmpty {
                    list?.append(Category(name: country.name,
                                          items: items))
                }
            }
        }
    }
    
    func shareRepeatedStickers() -> [String] {
        guard let list = list else { return [] }

        var repatedList = ["Minhas repetidas: "]
        
        for category in list {
            for item in (category.items.filter { $0.hasSticker }) {
                let sticker = "\(CountryHelper.getName(value: item.name)) \(item.index)"
                repatedList.append(sticker)
            }
        }
        
        return repatedList
    }
}
