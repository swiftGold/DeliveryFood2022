//
//  MenuCategoriesModel.swift
//  DeliveryFood2022
//
//  Created by Сергей Золотухин on 15.09.2022.
//

struct CategoryResponseModel {
    let categories: [MenuCategoriesModel]
}

struct MenuCategoriesModel {
    var text: String
    var isSelected: Bool
}
