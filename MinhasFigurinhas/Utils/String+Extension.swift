//
//  String+Extension.swift
//  MinhasFigurinhas
//
//  Created by Breno Luizetto on 23/08/22.
//

import Foundation

extension String {
    func getInitials() -> String {
        let lowerBound = String.Index(encodedOffset: 0)
        let upperBound = String.Index(encodedOffset: 3)
        
        return self[lowerBound ..< upperBound].uppercased()
    }

}
