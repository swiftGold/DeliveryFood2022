//
//  MapPresenter.swift
//  DeliveryFood2022
//
//  Created by Сергей Золотухин on 15.12.2022.
//

import Foundation
import GoogleMaps

protocol MapPresenterProtocol {
    var viewController: MapViewControllerProtocol? { get set }
}

final class MapPresenter {
    weak var viewController: MapViewControllerProtocol?
}

extension MapPresenter: MapPresenterProtocol {
    
}
