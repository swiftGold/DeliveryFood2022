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
    
    func updateTableView(_ sectionViewModel: [Catalog.Section])
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
        tableView.register(
            SalesTableViewCell.self,
            DeliveryCell.self,
            CategoriesTableViewCell.self,
            ProductTableViewCell.self
        )
        return tableView
    }()
    
    private var sectionViewModel: [Catalog.Section] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
}

extension CatalogViewController: DeliveryCellDelegate {
    func didTapChangeButton() {
        print("222")
    }
}

//MARK: - CatalogViewControllerProtocol Impl

extension CatalogViewController: CatalogViewControllerProtocol {
    func updateTableView(_ sectionViewModel: [Catalog.Section]) {
        self.sectionViewModel = sectionViewModel
        tableView.reloadData()
    }
}

//MARK: - UITableViewDelegate Impl
extension CatalogViewController: UITableViewDelegate {
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
        case .sales(let viewModel):
            let cell = tableView.dequeueReusableCell(withType: SalesTableViewCell.self, for: indexPath)
            cell.configureCell(with: viewModel)
            return cell
            
        case .delivery(let viewModel):
            let cell = tableView.dequeueReusableCell(withType: DeliveryCell.self, for: indexPath)
            cell.delegate = self
//            cell.configureCell(with: viewModel, delegate: delegate)
            return cell
            
        case .categories(let viewModel):
            let cell = tableView.dequeueReusableCell(withType: CategoriesTableViewCell.self, for: indexPath)
            cell.configureCell(with: viewModel)
            return cell
            
        case .product(let viewModel):
            let cell = tableView.dequeueReusableCell(withType: ProductTableViewCell.self, for: indexPath)
            cell.configureCell(with: viewModel)
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
        presenter?.viewDidLoad()
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



