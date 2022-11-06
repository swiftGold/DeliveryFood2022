//
//  CategoryModel.swift
//  DeliveryFood2022
//
//  Created by Сергей Золотухин on 15.09.2022.
//

struct CategoryResponseModel: Decodable {
    //то во что декодируем из json ответа. Содержит в себе тоже самое, что и json модель
    let id: Int
    let title: String
}

// то, с чем работаем в презенторе. Содержит в себе достаточное количество сырой информации для различных манипуляций
struct CategoryModel {
    let id: Int
    let title: String
    var isSelected: Bool
}
