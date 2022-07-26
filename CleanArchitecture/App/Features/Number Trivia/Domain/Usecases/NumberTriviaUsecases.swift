//
//  NumberTriviaUsecases.swift
//  CleanArchitecture
//
//  Created by mohamed on 7/20/22.
//

import Foundation

class NumberTriviaUsecases: NumberTriviaRepository {
    let repository = NumberTriviaRepositoryImpl(remoteDataSource: NumberTriviaRemoteDataSource(), localDataSource: NumberTriviaLocalDataSource())
    
    func getConcreteNumberTrivia(number: Int, completion: @escaping (Failures? , NumberTrivia?) -> ()) {
        repository.getConcreteNumberTrivia(number: number) { error, data in
            completion(error,data)
        }
    }
    
    func getRandomNumberTrivia(completion: @escaping (Failures? , NumberTrivia?) -> ()) {
        repository.getRandomNumberTrivia { error, data in
            completion(error,data)
        }
    }
}
