//
//  ModuleBuilder.swift
//  DeliveryFood2022
//
//  Created by Сергей Золотухин on 24.10.2022.
//

import Networking
import Core

protocol ModuleBuilderProtocol {
    func buildCatalogModule() -> CatalogViewController
}

final class ModuleBuilder {
    private let apiservice: APIServiceProtocol
    private let networkManager: NetworkManagerProtocol
    private let decoderManager: JSONDecoderManagerProtocol
    
    init() {
        decoderManager = JSONDecoderManager()
        networkManager = NetworkManager(jsonService: decoderManager)
        apiservice = APIService(
            networkManager: networkManager)
    }
}

extension ModuleBuilder: ModuleBuilderProtocol {
    func buildCatalogModule() -> CatalogViewController {
        
        let viewController = CatalogViewController()
        let presenter = CatalogPresenter(apiService: apiservice)
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
}
