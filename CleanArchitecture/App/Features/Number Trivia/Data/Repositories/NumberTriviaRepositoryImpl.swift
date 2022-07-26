//
//  NumberTriviaRepositoryImpl.swift
//  CleanArchitecture
//
//  Created by mohamed on 7/20/22.
//

import Foundation

class NumberTriviaRepositoryImpl: NumberTriviaRepository {
    
    var remoteDataSource: NumberTriviaRemoteDataSource?
    var localDataSource: NumberTriviaLocalDataSource?
    
    init(remoteDataSource: NumberTriviaRemoteDataSource? = nil,
         localDataSource: NumberTriviaLocalDataSource? = nil) {
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }
    
    func getConcreteNumberTrivia(number: Int, completion: @escaping (Failures?, NumberTrivia?) -> ()) {
        if NetworkInfoImpl.shared.isConnected {
            remoteDataSource?.getConcreteNumberTrivia(number: number, completion: { error, data in
                guard let data = data else {return}
                self.localDataSource?.cacheNumberTrivia(triviaToCache: data)
                let entite = NumberTrivia(number: data.number ?? 0, text: data.text ?? "")
                completion(error,entite)
            })
        } else {
            self.getLastNumberTrivia {failure, data in
                completion(nil, data)
            }
        }
    }
    
    func getRandomNumberTrivia(completion: @escaping (Failures?, NumberTrivia?) -> ()) {
        if NetworkInfoImpl.shared.isConnected {
            remoteDataSource?.getRandomNumberTrivia(completion: { error, data in
                if error != nil {
                    completion(error, nil)
                    return
                }
                guard let data = data else {return}
                self.localDataSource?.cacheNumberTrivia(triviaToCache: data)
                let entite = NumberTrivia(number: data.number ?? 0, text: data.text ?? "")
                completion(error,entite)
            })
        } else {
            self.getLastNumberTrivia {failure, data in
                completion(nil, data)
            }
        }
    }
    
    private func getLastNumberTrivia(completion: @escaping (Failures?, NumberTrivia?) -> ()) {
        localDataSource?.getLastNumberTrivia(completion: { data in
            let entite = NumberTrivia(number: data.number ?? 0, text: data.text ?? "")
            completion(nil,entite)
        })
    }
}
