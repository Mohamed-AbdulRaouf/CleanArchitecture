//
//  NumberTriviaLocalDataSource.swift
//  CleanArchitecture
//
//  Created by mohamed on 7/21/22.
//

import Foundation

typealias NumberTriviaLocalDataSourceHandler = (NumberTriviaModel) -> ()

protocol NumberTriviaLocalDataSource: AnyObject {
    
    func getLastNumberTrivia(completion: NumberTriviaLocalDataSourceHandler)
    func cacheNumberTrivia(triviaToCache: NumberTriviaModel)
}
