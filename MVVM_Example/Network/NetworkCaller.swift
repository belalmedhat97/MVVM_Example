//
//  NetworkCaller.swift
//  Network layer
//
//  Created by Belal medhat on 8/15/20.
//  Copyright © 2020 Belal medhat. All rights reserved.
//

import Foundation
import Combine

class Caller {
        
    static func Doggy() -> AnyPublisher<DogResponse, Error> { // identify which netowrk operation to do
        return run(DogAPIRouter.DogImage.urlRequest)
    }
    
    static func run<T: Codable>(_ request: URLRequest) -> AnyPublisher<T, Error> { // performer of all network calls
        return Network.Request(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
}
