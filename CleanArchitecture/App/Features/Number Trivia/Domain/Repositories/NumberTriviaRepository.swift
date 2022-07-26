//
//  NumberTriviaRepository.swift
//  CleanArchitecture
//
//  Created by mohamed on 7/20/22.
//

import Foundation

typealias NumberTriviaHandler = (Failures?, NumberTrivia?) -> ()

protocol NumberTriviaRepository: AnyObject {
    
    func getConcreteNumberTrivia(number: Int, completion: @escaping NumberTriviaHandler)
    func getRandomNumberTrivia(completion: @escaping NumberTriviaHandler)
}
