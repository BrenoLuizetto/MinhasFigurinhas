//
//  HomeViewModel.swift
//  MinhasFigurinhas
//
//  Created by Breno Luizetto on 22/08/22.
//

import Foundation
import UIKit

protocol CountriesViewModelProtocol {
    var list: [CountryModel]? { get }
    var key: String { get }
    var title: String { get }
    
    func getStickersCount(key: String) -> Int
    func getNeededStickers() -> [String]
}

class CountriesViewModel: CountriesViewModelProtocol {
    
    var list: [CountryModel]?
    var key: String
    var title: String
    
    init(key: String,
         title: String) {
        self.key = key
        self.title = title
        setData()
    }
    
    func setData() {
        list = CountryListMock.getList()
    }
    
    func getStickersCount(key: String) -> Int {
        switch key {
        case "acquired":
            return getStickerCount(type: .acquired)
            
        case "needed":
            return getNeededStickerCount()
            
        case "repeated":
            return getStickerCount(key: "Repeated",
                                   type: .repeated)
            
        default:
            return 0
        }
    }
    
    private func getStickerCount(key: String = "",
                                 type: StickerListType) -> Int {
        var count = 0
        
        guard let list = list else {
            return 0
        }
        
        for country in list {
            let stickerList = StickerHelper.getList(name: country.name,
                                                  key: key,
                                                  listType: type)
            for _ in (stickerList.filter { $0.hasSticker }) {
                count = count + 1
            }
        }
        
        return count
    }
    
    func getNeededStickerCount() -> Int {
        return 670 - getStickerCount(type: .acquired)
    }
    
    func getNeededStickers() -> [String] {
        var neededList = [String]()

        guard let list = list else { return neededList }
        
        for country in list {
            let stickerList = StickerHelper.getList(name: country.name,
                                                  listType: .acquired)
            for sticker in (stickerList.filter { $0.hasSticker == false }) {
                neededList.append("\(sticker.name) \(sticker.index)")
            }
        }
        
        return neededList
    }
}
