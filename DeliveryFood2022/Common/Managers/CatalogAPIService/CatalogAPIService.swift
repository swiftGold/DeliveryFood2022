//
//  CatalogAPIService.swift
//  DeliveryFood2022
//
//  Created by Сергей Золотухин on 25.10.2022.
//

//"https://gist.github.com/swiftGold/f81354b11c09dc99fee89d674ea51088"

import Networking
import Core

protocol APIServiceProtocol {
    func fetchSales(_ completion: @escaping (Result<[SaleResponseModel], Error>) -> Void)
    func fetchCategories(_ completion: @escaping (Result<[CategoryResponseModel], Error>) -> Void)
    func fetchProducts(_ completion: @escaping (Result<[ProductResponseModel], Error>) -> Void)
}

final class APIService {
    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
}

extension APIService: APIServiceProtocol {
    
    func fetchSales(_ completion: @escaping (Result<[SaleResponseModel], Error>) -> Void) {
        
        let urlString = "https://gist.githubusercontent.com/swiftGold/f81354b11c09dc99fee89d674ea51088/raw/276d3fb43884911fd15bf897ec5b2a02122c7217/Promotions.json"
        networkManager.request(urlString: urlString, completion: completion)
    }
    
    func fetchCategories(_ completion: @escaping (Result<[CategoryResponseModel], Error>) -> Void) {
        
        let urlString = "https://gist.githubusercontent.com/swiftGold/f81354b11c09dc99fee89d674ea51088/raw/2defa88b670bbb92b6bf49e753aada81ddb6c6cc/Categories.json"
        networkManager.request(urlString: urlString, completion: completion)
    }
    
    func fetchProducts(_ completion: @escaping (Result<[ProductResponseModel], Error>) -> Void) {
        
        let urlString = "https://gist.githubusercontent.com/swiftGold/f81354b11c09dc99fee89d674ea51088/raw/41acc85f8e565b0c4a94ef6b02ff717139b47521/Products.json"
        networkManager.request(urlString: urlString, completion: completion)
    }
}
