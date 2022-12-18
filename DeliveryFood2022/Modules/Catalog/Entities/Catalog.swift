//
//  Catalog.swift
//  DeliveryFood2022
//
//  Created by Сергей Золотухин on 08.09.2022.
//

enum Catalog {
    struct Section {
        var type: SectionType
        var rows: [Row]
    }

    enum SectionType {
        case sales
        case delivery
        case products(CategoriesHeaderViewModel)

        case salesPlaceHolder
//        case productPlaceholder
    }

    enum Row {
        case sales(viewModel: SalesCellViewModel)
        case delivery(viewModel: DeliveryCellViewModel)
        case product(viewModel: ProductCellViewModel)
        
        case salesPlaceHolder
//        case productPlaceholder
    }
}
