//
//  UIButton+Extension.swift
//  MinhasFigurinhas
//
//  Created by Breno Luizetto on 23/08/22.
//


import UIKit

extension UIButton {
    func setButtonState(type: ButtonStyle,
                        isRepeated: Bool = false,
                        enabledColor: UIColor = UIColor(rgb: 0x029F0C)) {
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.cornerRadius = 5
        self.titleLabel?.font = UIFont(name: "Avenir-Bold", size: 20)
        
        switch type {
        case .add:
            self.setTitle("Adicionar",
                          for: .normal)
            self.backgroundColor = .clear
            self.layer.borderWidth = 1

        case .remove:
            if isRepeated {
                self.setTitle("Remover",
                              for: .normal)
                self.backgroundColor = UIColor(rgb: 0xD20202)
            } else {
                self.setTitle("Adquirida",
                              for: .normal)
                self.backgroundColor = enabledColor
            }
            
            self.layer.borderWidth = 0

        case .repeated:
            self.setTitle("Remover",
                          for: .normal)
        }
    }
}
