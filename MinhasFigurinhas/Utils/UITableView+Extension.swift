//
//  UITableView+Extension.swift
//  MinhasFigurinhas
//
//  Created by Breno Luizetto on 26/08/22.
//

import Foundation
import UIKit

extension UITableView {
    
    func reloadWithTransition() {
        UIView.transition(with: self,
                          duration: 1.0,
                          options: .allowUserInteraction,
                          animations: {self.reloadData()},
                          completion: nil)
    }
}
