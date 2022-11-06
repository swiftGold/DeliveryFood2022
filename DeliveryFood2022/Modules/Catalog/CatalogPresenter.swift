//
//  CatalogPresenter.swift
//  DeliveryFood2022
//
//  Created by Сергей Золотухин on 08.09.2022.
//

import Foundation
import RealmSwift
import Alamofire

protocol CatalogPresenterProtocol: AnyObject {
    var viewController: CatalogViewControllerProtocol? { get set }
    
    func viewDidLoad()
}

final class CatalogPresenter {
    weak var viewController: CatalogViewControllerProtocol?
    
    private var sales: [SaleModel] = []
    private var categories: [CategoryModel] = []
    private var products: [ProductModel] = []
    private var apiService: APIServiceProtocol
    
    init(apiService: APIServiceProtocol) {
        self.apiService = apiService
    }
}

//MARK: - CatalogPresenter extension

extension CatalogPresenter: CatalogPresenterProtocol {
    func viewDidLoad() {
        DispatchQueue.global().async { [weak self] in
            let group = DispatchGroup()
            
            group.enter()
            
            self?.apiService.fetchCategories { result in
                switch result {
        
                case .success(let response):
                    self?.categories = response.enumerated().map { index, category in
                        CategoryModel(
                            id: category.id,
                            title: category.title,
                            isSelected: index == 0 ? true : false
                        )
                    }
                case .failure(let error):
                    print(error, error.localizedDescription)
                }
                group.leave()
            }
            
            group.wait()
            group.enter()

            self?.apiService.fetchSales { result in
                switch result {
                    
                case .success(let response):
                    self?.sales = response.map { sale in
                        SaleModel(sale)
                    }
                case .failure(let error):
                    print(error, error.localizedDescription)
                }
                group.leave()
            }
            
            group.wait()
            group.enter()
            
            self?.apiService.fetchProducts { result in
                switch result {
                //смапили, потому что приписали init у модели
                case .success(let response):
                    print("!!!!!PRODUCTS!!!!!!\(response)")
                    self?.products = response.map {
                        ProductModel($0)
                    }
                case .failure(let error):
                    print("НЕТ ПРОДУКТОВ!!!!!!!")
                    print(error, error.localizedDescription)
                }
                group.leave()
            }
            
            group.wait()
            
            group.notify(queue: DispatchQueue.main) {
                self?.updateTableView()
            }
        }
    }
}

//MARK: - Private methods
private extension CatalogPresenter {
    func updateTableView() {
        
        let section: [Catalog.Section] = [
        makeSalesSection(),
        makeCategoriesSection(),
        makeProductSection()
        ]
        viewController?.updateTableView(section)
    }
    
    func makeSalesSection() -> Catalog.Section {
        let viewModel = sales.map {
            SaleCellViewModel(imageUrl: $0.imageUrlString)
        }
        let salesViewModel = SalesCellViewModel(sales: viewModel)
        let section = Catalog.Section(type: .sales, rows: [.sales(viewModel: salesViewModel)])
        
        return section
    }
    
    func makeCategoriesSection() -> Catalog.Section {
        let viewModel = categories.map { category -> CategoryCellViewModel in
            CategoryCellViewModel(title: category.title, isSelected: category.isSelected)
        }
        let categoriesViewModel = CategoriesCellViewModel(categories: viewModel)
        let section = Catalog.Section(type: .categories, rows: [.categories(viewModel: categoriesViewModel)])
        
        return section
    }
    
    func makeProductSection() -> Catalog.Section {
        let rows = products.map { product -> Catalog.Row in
            let viewModel = ProductCellViewModel(
                title: product.title,
                description: product.description,
                price: "\(product.price) \(product.currency)",
                imageUrl: product.imageUrlString
            )
            return Catalog.Row.product(viewModel: viewModel)
        }
        let result = Catalog.Section(type: .products, rows: rows)
        return result
    }
}

enum NameSpace {
    
    struct CategoryResponseModel {
        let id: String
        let title: String
    }
    
    struct CategoryModel {
        let id: String
        let title: String
        var isSelected: Bool
    }
    
    struct CategoryViewModel {
        let title: String
        let isSelected: Bool
    }
}
