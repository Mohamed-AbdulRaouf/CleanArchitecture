//
//  NumberTriviaModel.swift
//  CleanArchitecture
//
//  Created by mohamed on 7/20/22.
//

import Foundation

struct NumberTriviaModel {
    let text : String?
    let number : Int?
    
    enum CodingKeys: String, CodingKey {
        case text = "text"
        case number = "number"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        text = try values.decodeIfPresent(String.self, forKey: .text)
        number = try values.decodeIfPresent(Int.self, forKey: .number)
    }
}
