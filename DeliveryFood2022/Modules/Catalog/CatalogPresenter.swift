//
//  CatalogPresenter.swift
//  DeliveryFood2022
//
//  Created by Сергей Золотухин on 08.09.2022.
//

import Foundation

protocol CatalogPresenterProtocol: AnyObject {
    
    var viewController: CatalogViewControllerProtocol? { get set }
}

final class CatalogPresenter {
    
    weak var viewController: CatalogViewControllerProtocol?
}

// MARK: - Private methods

extension CatalogPresenter: CatalogPresenterProtocol {

}
