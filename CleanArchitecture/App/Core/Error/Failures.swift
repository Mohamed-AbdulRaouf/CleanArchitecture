//
//  Failures.swift
//  CleanArchitecture
//
//  Created by mohamed on 7/20/22.
//

import Foundation

enum FailuresMessageError: String {
    case noInternet
    case decodingError
    case cacheException
    case serverException
}

class Failures: Error {
    var message = ""
    
    init(message: String = "") {
        self.message = message
    }
}

class ServerFailure: Failures {}

class CacheFailure: Failures {}
