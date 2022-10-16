//
//  SalesCell.swift
//  DeliveryFood2022
//
//  Created by Сергей Золотухин on 09.09.2022.
//

import UIKit

final class SalesCell: UITableViewCell {
    
    private let collectionView: UICollectionView = {

        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        layout.itemSize = CGSize(width: 310, height: 106)
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
        collectionView.contentInsetAdjustmentBehavior = .always
        collectionView.backgroundColor = .clear
        collectionView.bounces = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(SalesImageCell.self, forCellWithReuseIdentifier: "SalesImageCell")
        
        return collectionView
    }()
            
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UICollectionViewDataSource Impl

extension SalesCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SalesImageCell", for: indexPath) as? SalesImageCell else { fatalError("")
        }
        return cell
    }
}

// MARK: - UICollectionViewDelegate Impl

extension SalesCell: UICollectionViewDelegate {

}

// MARK: - UICollectionViewDelegateFlowLayout Impl

//extension SalesCell: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(
//            width: 310,
//            height: 106
//        )
//    }
//}

// MARK: - Private methods

private extension SalesCell {
    func setupCell() {

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
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            collectionView.heightAnchor.constraint(equalToConstant: 106)
        ])
    }
}
