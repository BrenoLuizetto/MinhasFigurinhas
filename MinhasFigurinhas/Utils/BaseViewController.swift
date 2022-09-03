//
//  BaseViewController.swift
//  MinhasFigurinhas
//
//  Created by Breno Luizetto on 24/08/22.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func loadView() {
        self.configDefaultNavBar()
    }
    
    func configDefaultNavBar() {
        self.navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = .white
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
