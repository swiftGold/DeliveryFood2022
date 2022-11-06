//
//  SaleModel.swift
//  DeliveryFood2022
//
//  Created by Сергей Золотухин on 09.09.2022.
//

struct SaleResponseModel: Decodable {
    let id: Int
    let imageUrlString: String
}

struct SaleModel {
    let id: Int
    let imageUrlString: String
    
    init(id: Int, imageUrlString: String) {
        self.id = id
        self.imageUrlString = imageUrlString
    }
    
    init(_ response: SaleResponseModel) {
        id = response.id
        imageUrlString = response.imageUrlString
    }
}

