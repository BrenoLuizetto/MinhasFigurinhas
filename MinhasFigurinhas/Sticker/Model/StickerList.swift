//
//  StickerList.swift
//  MinhasFigurinhas
//
//  Created by Breno Luizetto on 23/08/22.
//


enum StickerListType {
    case acquired
    case repeated
}

import Foundation


struct Category {
    
   let name : String
    
   var items : [StickerList]
    
}

struct StickerList: Decodable,
                    Encodable {
    
    let name: String
    
    let index: Int
    
    let imagePath: String
    
    let hasSticker: Bool
    
}


extension StickerList {
    
    func getNameIndex() -> String {
        return name + String(describing: index)
    }
}
