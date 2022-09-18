//
//  NetworkManager.swift
//  Networking
//
//  Created by Сергей Золотухин on 06.09.2022.
//

import Foundation

protocol NetworkManagerProtocol {
    
    func request(_ urlString: String, completion: @escaping(Result<Data, Error>) -> Void)
}

final class NetworkManager {
    
}

extension NetworkManager: NetworkManagerProtocol {
    
    func request(_ urlString: String, completion: @escaping(Result<Data, Error>) -> Void) {
        
        let session = URLSession.shared
        let request = URLRequest(url: URL(string: urlString)!)
        let task = session.dataTask(with: request) { data, response, error in
            
            guard let data = data else {
                let myError = NSError(domain: "my error domain", code: -123, userInfo: nil)
                completion(.failure(myError))
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
}
