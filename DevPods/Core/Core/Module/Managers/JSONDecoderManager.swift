//
//  JSONDecoderManager.swift
//  Core
//
//  Created by Сергей Золотухин on 06.09.2022.
//

import Foundation

public protocol JSONDecoderManagerProtocol {
    func decode<T: Decodable>(_ data: Data) -> T?
    func decode<T: Decodable>(_ data: Data, completion: (Result<T, Error>) -> Void)
}

public final class JSONDecoderManager {
    
    private let decoder = JSONDecoder()
    
    public init() {}
}

extension JSONDecoderManager: JSONDecoderManagerProtocol {
    
    public func decode<T: Decodable>(_ data: Data) -> T? {
        do {
            let result = try decoder.decode(T.self, from: data)
            return result
        } catch {
            print(error, error.localizedDescription)
            return nil
        }
    }
    
    public func decode<T: Decodable>(_ data: Data, completion: (Result<T, Error>) -> Void) {
        
        do {
            let result = try decoder.decode(T.self, from: data)
            return completion(.success(result))
        } catch {
            return completion(.failure(error))
        }
    }
}
