//
//  Failures.swift
//  CleanArchitecture
//
//  Created by mohamed on 7/20/22.
//

import Foundation

public typealias Failure = (Error)

enum FailuresError: Error {
    case noInternet
}

class Failures: Error {
    var message = ""
}

class ServerFailure: Failures {}

class CacheFailure: Failures {}
