//
//  File.swift
//  MinhasFigurinhas
//
//  Created by Breno Luizetto on 23/08/22.
//

import Foundation
import UIKit

class StickerTableView: UITableView {
    
    func setData(dataSource: UITableViewDataSource,
                 delegate: UITableViewDelegate) {
        self.backgroundColor = .black
        self.register(StickerTableViewCell.self,
                      forCellReuseIdentifier: "StickerTableViewCell")
        self.dataSource = dataSource
        self.delegate = delegate
    }
    
}
