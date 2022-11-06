//
//  NetworkManager.swift
//  Networking
//
//  Created by Сергей Золотухин on 06.09.2022.
//

import Foundation
import Core

public protocol NetworkManagerProtocol {
    func request<T: Decodable>(urlString: String, completion: @escaping (Result<T, Error>) -> Void)
}

public final class NetworkManager {
    private let jsonService: JSONDecoderManagerProtocol
    public init(jsonService: JSONDecoderManagerProtocol) {
        self.jsonService = jsonService
    }
}

extension NetworkManager: NetworkManagerProtocol {

    public func request<T: Decodable>(urlString: String, completion: @escaping (Result<T, Error>) -> Void) {
        let session = URLSession.shared
        let request = URLRequest(url: URL(string: urlString)!)
        let task = session.dataTask(with: request) { data, response, error in
            
            guard let data = data else {
                let myError = NSError(domain: "my error domain", code: -123, userInfo: nil)
                completion(.failure(myError))
                return
            }
            self.jsonService.decode(data, completion: completion)
        }
        task.resume()
    }
}
