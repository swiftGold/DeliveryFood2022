//
//  CategoriesHeaderViewModel.swift
//  DeliveryFood2022
//
//  Created by Сергей Золотухин on 02.11.2022.
//



struct CategoriesHeaderViewModel {
    let categories: [CategoryCellViewModel]
}


////09/12/22
//protocol CategoriesHeaderViewModelDelegate: AnyObject {
//    func didTapCell(index: Int)
//}
//
//struct CategoriesHeaderViewModel {
//    let categories: [CategoryCellViewModel]
//    weak var delegate: CategoriesHeaderViewModelDelegate?
//}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//enum Categories {
//    struct Section {
//        var type: SectionType
//    }
//
//    enum SectionType {
//        case categories(CategoriesHeaderViewModel)
//        case categoriesPlaceholder
//    }
//}
