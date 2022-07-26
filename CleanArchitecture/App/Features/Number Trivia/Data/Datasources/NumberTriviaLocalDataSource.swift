//
//  NumberTriviaLocalDataSource.swift
//  CleanArchitecture
//
//  Created by mohamed on 7/21/22.
//

import Foundation

typealias NumberTriviaLocalDataSourceHandler = (NumberTriviaModel) -> ()

protocol NumberTriviaLocalDataSourcePro: AnyObject {
    
    func getLastNumberTrivia(completion: NumberTriviaLocalDataSourceHandler)
    func cacheNumberTrivia(triviaToCache: NumberTriviaModel)
}

class NumberTriviaLocalDataSource: NumberTriviaLocalDataSourcePro {
    
    func getLastNumberTrivia(completion: (NumberTriviaModel) -> ()) {
        if let savedPerson = UserDefaults.standard.object(forKey: "NumberTrivia") as? Data {
            let decoder = JSONDecoder()
            if let numberTrivia = try? decoder.decode(NumberTriviaModel.self, from: savedPerson) {
                completion(numberTrivia)
            }
        }
    }
    
    func cacheNumberTrivia(triviaToCache: NumberTriviaModel) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(triviaToCache) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "NumberTrivia")
        }
    }
}
