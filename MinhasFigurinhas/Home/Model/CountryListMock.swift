//
//  CountryListMock.swift
//  MinhasFigurinhas
//
//  Created by Breno Luizetto on 22/08/22.
//

import Foundation
import UIKit

class CountryListMock {
    
    static func getList() -> [CountryModel] {
        
        var list: [CountryModel] = []
        
        let countries = ["FifaWorldCup",
                         "Catar",
                         "Equador",
                         "Senegal",
                         "Holanda",
                         "Inglaterra",
                         "Ira",
                         "EstadosUnidos",
                         "PaisDeGales",
                         "Argentina",
                         "Arabia",
                         "Mexico",
                         "Polonia",
                         "Franca",
                         "Australia",
                         "Dinamarca",
                         "Tunisia",
                         "Espanha",
                         "CostaRica",
                         "Alemanha",
                         "Japao",
                         "Belgica",
                         "Canada",
                         "Marrocos",
                         "Croacia",
                         "Brasil",
                         "Servia",
                         "Suica",
                         "Camaroes",
                         "Portugal",
                         "Gana",
                         "Uruguai",
                         "Coreia"
        ]
        
        for country in countries {
            let countryImage = UIImage(named: country)
            let country = CountryModel(name: country,
                                      teamShield: countryImage)
            list.append(country)
        }
        
        return list
    }
}
