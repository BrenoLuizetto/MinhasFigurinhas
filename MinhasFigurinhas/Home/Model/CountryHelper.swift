//
//  CountryHelper.swift
//  MinhasFigurinhas
//
//  Created by Breno Luizetto on 25/08/22.
//

import Foundation

enum CountryHelperName: String {
    case FifaWorldCup
    case Ira
    case EstadosUnidos
    case PaisDeGales
    case Arabia
    case Mexico
    case Franca
    case Australia
    case CostaRica
    case Japao
    case Belgica
    case Canada
    case Croacia
    case Servia
    case Suica
    case Camaroes
    case Coreia
}

class CountryHelper {
    
    static func getName(value: String) -> String {
        let countryHelperName = CountryHelperName(rawValue: value)
        
        switch countryHelperName {
        case .FifaWorldCup:
            return "Fifa World Cup"
        case .Ira:
            return "Irã"
        case .EstadosUnidos:
            return "Estados Unidos"
        case .PaisDeGales:
            return "País de Gales"
        case .Arabia:
            return "Arábia Saudita"
        case .Mexico:
            return "México"
        case .Franca:
            return "França"
        case .Australia:
            return "Austrália"
        case .CostaRica:
            return "Costa Rica"
        case .Japao:
            return "Japão"
        case .Belgica:
            return "Bélgica"
        case .Canada:
            return "Canadá"
        case .Croacia:
            return "Croácia"
        case .Servia:
            return "Sérvia"
        case .Suica:
            return "Suiça"
        case .Camaroes:
            return "Camarões"
        case .Coreia:
            return "República da Coreia"
        
        default:
            return value
        }
    }
}
