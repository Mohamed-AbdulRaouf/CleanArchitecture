//
//  NumberTriviaRemoteDataSource.swift
//  CleanArchitecture
//
//  Created by mohamed on 7/20/22.
//

import Foundation

typealias NumberTriviaRemoteDataSourceHandler = (Failures?, NumberTriviaModel?) -> ()

protocol NumberTriviaRemoteDataSourcePro: AnyObject {
    
    func getConcreteNumberTrivia(number: Int, completion: @escaping NumberTriviaRemoteDataSourceHandler)
    func getRandomNumberTrivia(completion: @escaping NumberTriviaRemoteDataSourceHandler)
}

class NumberTriviaRemoteDataSource: NumberTriviaRemoteDataSourcePro {
    
    func getConcreteNumberTrivia(number: Int, completion: @escaping (Failures?, NumberTriviaModel?) -> ()) {
        requestByApi(apiName: "\(EndpointsUrl.getConcreteNumberTrivia.rawValue)\(number)?json",
                     completion: completion)
    }
    
    func getRandomNumberTrivia(completion: @escaping (Failures?, NumberTriviaModel?) -> ()) {
        requestByApi(apiName: EndpointsUrl.getRandomNumberTrivia.rawValue,
                     completion: completion)
    }
    
    private func requestByApi(apiName: String,
                              completion: @escaping (Failures?, NumberTriviaModel?) -> ()) {
        guard let url = URL(string: "\(apiName)") else {
            print("Invalid URL")
            return
        }
        let session = URLSession.shared
        let request = URLRequest(url: url)
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            guard error == nil else {
                return
            }
            guard let data = data else {
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let response = try decoder.decode(NumberTriviaModel.self, from: data)
                print(response)
                completion(nil, response)
            } catch (let error) {
                print(error.localizedDescription.description)
                let failure = Failures(message: error.localizedDescription.description)
                completion(failure, nil)
            }
        })
        task.resume()
    }
}
