//
//  NetworkInfo.swift
//  CleanArchitecture
//
//  Created by mohamed on 7/20/22.
//

import Foundation
import Connectivity

protocol NetworkInfo {
    var isConnected: Bool { get set}
}

class NetworkInfoImpl: NetworkInfo {
    
    static var shared = NetworkInfoImpl()
    var connectivity = Connectivity()
    var isConnected: Bool
    
    init() {
        self.isConnected = true //self.connectivity.isConnected
    }
}
