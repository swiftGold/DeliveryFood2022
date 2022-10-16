//
//  CatalogViewController.swift
//  DeliveryFood2022
//
//  Created by Сергей Золотухин on 05.09.2022.
//

import Core
import Networking
import UIKit

protocol CatalogViewControllerProtocol: AnyObject {
    var presenter: CatalogPresenterProtocol? { get set }
}

class CatalogViewController: UIViewController {
    
    var presenter: CatalogPresenterProtocol?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(SalesCell.self, forCellReuseIdentifier: "SalesCell")
        tableView.register(DeliveryCell.self, forCellReuseIdentifier: "DeliveryCell")
        tableView.register(MenuElementsCell.self, forCellReuseIdentifier: "MenuElementsCell")
        tableView.register(MenuItemCell.self, forCellReuseIdentifier: "MenuItemCell")
        return tableView
    }()
    
    private var sectionViewModel: [SectionViewModel] = [
        SectionViewModel(
            type: .sale,
            rows: [.sale(viewModel: SaleViewModel())
                  ]
        ),
        SectionViewModel(
            type: .delivery,
            rows: [.delivery(viewModel: DeliveryViewModel())
                  ]
        ),
        SectionViewModel(
            type: .menuElement,
            rows: [.menuElement(viewModel: MenuElementModel())
                  ]
        ),
        SectionViewModel(
            type: .menuItem,
            rows: [.menuItem(viewModel:
                                MenuItemsModel(
                                    nameLabelText: "мраморная говядина",
                                    descriptionLabelText: "Мраморная говядина, лук, молотый перец и соль, 165гр.",
                                    costLabelText: "90 руб.")),
                   .menuItem(viewModel:
                                MenuItemsModel(nameLabelText: "курица по-азиатски",
                                                       descriptionLabelText: "Куриное филе, сладкий соус чили, 135гр.",
                                                       costLabelText: "90 руб.")),
                   .menuItem(viewModel:
                                MenuItemsModel(nameLabelText: "моцарелла",
                                                       descriptionLabelText: "Сыр моцарелла, 125гр.",
                                                       costLabelText: "90 руб.")),
                  ]
        )
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewController()
    }
}

//MARK: - CatalogViewControllerProtocol Impl

extension CatalogViewController: CatalogViewControllerProtocol {

}

//MARK: - UITableViewDelegate Impl
extension CatalogViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return CGFloat(122)
//    }
}

//MARK: - UITableViewDataSource Impl
extension CatalogViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sectionViewModel.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        sectionViewModel[section].rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let row = indexPath.row
        let section = indexPath.section
        let rowType = sectionViewModel[section].rows[row]
        switch rowType {
        case .sale(let viewModel):
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SalesCell", for: indexPath) as? SalesCell else { return UITableViewCell()
            }
            cell.backgroundColor = .clear
            return cell
            
        case .delivery(let viewModel):
        
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DeliveryCell", for: indexPath) as? DeliveryCell else { return UITableViewCell()
            }
            cell.backgroundColor = .clear
            return cell
            
        case .menuElement(let viewModel):
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MenuElementsCell", for: indexPath) as? MenuElementsCell else { return UITableViewCell()
            }
            cell.backgroundColor = .clear
            return cell
            
        case .menuItem(let viewModel):
           
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItemCell", for: indexPath) as? MenuItemCell else { return UITableViewCell()
            }
            cell.backgroundColor = .clear
            cell.cellConfig(viewModel)
            return cell
        }
    }
}

//MARK: - Private methods
private extension CatalogViewController {
    
    func setupViewController() {
        view.backgroundColor = .carbon

        addSubviews()
        setConstraint()
    }
    
    func addSubviews() {
        view.addSubview(tableView)
    }
    
    func setConstraint() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}



