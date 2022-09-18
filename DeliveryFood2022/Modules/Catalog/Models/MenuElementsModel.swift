//
//  MenuElementsModel.swift
//  DeliveryFood2022
//
//  Created by Сергей Золотухин on 15.09.2022.
//

struct MenuModel {
    let elements: [MenuElementsModel]
}

struct MenuElementsModel {
    var text: String
    var isSelected: Bool
}
