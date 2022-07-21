//
//  NumberTriviaRemoteDataSource.swift
//  CleanArchitecture
//
//  Created by mohamed on 7/20/22.
//

import Foundation

typealias NumberTriviaRemoteDataSourceHandler = (NumberTriviaModel?) -> ()

protocol NumberTriviaRemoteDataSourcePro: AnyObject {
    
    func getConcreteNumberTrivia(number: Int, completion: NumberTriviaRemoteDataSourceHandler)
    func getRandomNumberTrivia(completion: NumberTriviaRemoteDataSourceHandler)
}

class NumberTriviaRemoteDataSource: NumberTriviaRemoteDataSourcePro {
    
    func getConcreteNumberTrivia(number: Int, completion: (NumberTriviaModel?) -> ()) {
        
    }
    
    func getRandomNumberTrivia(completion: (NumberTriviaModel?) -> ()) {
        
    }
}
