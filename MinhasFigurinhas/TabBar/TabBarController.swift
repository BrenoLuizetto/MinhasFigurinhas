//
//  TabBarController.swift
//  MinhasFigurinhas
//
//  Created by Breno Luizetto on 25/08/22.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.barStyle = .black
        tabBar.isTranslucent = true
        buildView()
    }
    
    func buildView() {
        let viewModel = CountriesViewModel(key: "",
                                      title: "Minhas Figurinhas")
        let homeVC = UINavigationController(rootViewController: CountriesViewController(viewModel: viewModel))
        homeVC.tabBarItem.image = UIImage(systemName: "folder")
        homeVC.tabBarItem.selectedImage = UIImage(systemName: "folder.fill")
        homeVC.tabBarItem.title = "Inicio"
        
        let repeatedVC = UINavigationController(rootViewController: RepeatedStickerViewController())
        repeatedVC.tabBarItem.image = UIImage(systemName: "square.and.pencil")
        repeatedVC.tabBarItem.title = "Repetidas"
        
        
        viewControllers = [homeVC, repeatedVC]
        guard let items = tabBar.items else {return }
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        }
    }
}
