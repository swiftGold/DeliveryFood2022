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
        case categories
        case products
    }

    enum Row {
        case sales(viewModel: SalesCellViewModel)
        case delivery(viewModel: DeliveryCellViewModel)
        case categories(viewModel: CategoriesCellViewModel)
        case product(viewModel: ProductCellViewModel)
    }
}
