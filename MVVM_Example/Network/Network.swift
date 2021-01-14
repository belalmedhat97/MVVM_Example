//
//  Network.swift
//  MVVM_Example
//
//  Created by Belal medhat on 11/9/20.
//  Copyright © 2020 Belal medhat. All rights reserved.
//

import Foundation
import Combine

struct HTTPResponse<T> {
    let value: T
    let response: URLResponse
}

struct Network {
    static func Request<T: Decodable>(_ request: URLRequest) -> AnyPublisher<HTTPResponse<T>, Error> {
        return URLSession(configuration: .default).dataTaskPublisher(for: request)
            .retry(3)
            .tryMap { result -> HTTPResponse<T> in
                let ResponseDecoder = try JSONDecoder().decode(T.self, from: result.data)
                return HTTPResponse(value: ResponseDecoder, response: result.response)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
