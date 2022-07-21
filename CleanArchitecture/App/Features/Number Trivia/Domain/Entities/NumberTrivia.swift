//
//  NumberTrivia.swift
//  CleanArchitecture
//
//  Created by mohamed on 7/20/22.
//

import Foundation

struct NumberTrivia: Equatable {
    
    var number: Int
    var text: String
    
    init(number: Int, text: String) {
        self.number = number
        self.text = text
    }
}
