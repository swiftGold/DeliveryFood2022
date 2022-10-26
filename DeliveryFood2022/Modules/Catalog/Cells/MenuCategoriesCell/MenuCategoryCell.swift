//
//  MenuCategoryCell.swift
//  DeliveryFood2022
//
//  Created by Сергей Золотухин on 15.09.2022.
//

import UIKit
 
final class MenuCategoryCell: UITableViewCell {
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.itemSize = CGSize(width: 84, height: 33)
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        collectionView.contentInsetAdjustmentBehavior = .always
        collectionView.backgroundColor = .clear
        collectionView.bounces = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(MenuLabelCell.self, forCellWithReuseIdentifier: "MenuLabelCell")
        return collectionView
    }()
        
    private var viewModel: MenuModel?
    
    private var menuCategoriesModel = [
        MenuCategoriesModel(text: "Чебуреки", isSelected: false),
        MenuCategoriesModel(text: "Завтраки", isSelected: true),
        MenuCategoriesModel(text: "ЧебурекМИ", isSelected: false),
        MenuCategoriesModel(text: "Добавки", isSelected: false),
    ]
            
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UICollectionViewDataSource Impl

extension MenuCategoryCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuCategoriesModel.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuLabelCell", for: indexPath) as? MenuLabelCell else { return UICollectionViewCell()
        }
        cell.cellConfig(menuCategoriesModel[indexPath.item])
        return cell
    }
}

// MARK: - UICollectionViewDelegate Impl

extension MenuCategoryCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}

// MARK: - Private methods

private extension MenuCategoryCell {
    func setupCell() {
        backgroundColor = .clear
        addSubviews()
        setConstraints()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func addSubviews() {
        contentView.myAddSubView(collectionView)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            collectionView.heightAnchor.constraint(equalToConstant: 49)
        ])
    }
}
