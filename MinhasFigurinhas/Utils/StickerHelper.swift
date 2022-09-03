//
//  StickerHelper.swift
//  MinhasFigurinhas
//
//  Created by Breno Luizetto on 03/09/22.
//

import Foundation

class StickerHelper {
    static func getList(name: String,
                        key: String = "",
                        index: Int = 1,
                        stickerList: [StickerList] = [],
                        listType: StickerListType) -> [StickerList] {
        
        let finalIndex = name == "FifaWorldCup" ? 30 : 21
        if index == finalIndex {
            return stickerList
        }
        
        var auxList = stickerList
        let hasSticker = hasSticker(key: name + key, index)
        
        switch listType {
        case .acquired:
            auxList.append(StickerList(name: name,
                                       index: index,
                                       imagePath: name,
                                       hasSticker: hasSticker))
        case .repeated:
            if hasSticker {
                auxList.append(StickerList(name: name,
                                           index: index,
                                           imagePath: name,
                                           hasSticker: hasSticker))
            }
        }
        
        return getList(name: name,
                       key: key,
                       index: index + 1,
                       stickerList: auxList,
                       listType: listType)
    }
    
    static func hasSticker(key: String,
                           _ index: Int) -> Bool {
        let us = UserDefaults.standard
        
        do {
            let acquiredList = try us.getObject(forKey: key,
                                                castTo: [Int].self)
            return validateSticker(index: index,
                            data: acquiredList)
        } catch {
            return false
        }

    }
    
    static func validateSticker(index: Int,
                                data: [Int]) -> Bool {
        let hasSticker = data.contains(where: {
            $0 == index
        })
        
        return hasSticker
    }
    
    static func updateSticker(key: String,
                              index: Int) -> Bool {
        let us = UserDefaults.standard
        
        do {
            var acquiredList = try us.getObject(forKey: key,
                                                castTo: [Int].self)
            if !validateSticker(index: index,
                               data: acquiredList) {
                acquiredList.append(index)
                try us.setObject(acquiredList,
                                 forKey: key)
                return true
            } else {
                acquiredList.removeAll(where: {$0 == index})
                try? us.setObject(acquiredList,
                                  forKey: key)
                return false
            }
        } catch {
            try! us.setObject([index],
                              forKey: key)
            return true
        }
    }
}
