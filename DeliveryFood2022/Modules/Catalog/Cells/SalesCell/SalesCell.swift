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
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        collectionView.contentInsetAdjustmentBehavior = .always
        collectionView.backgroundColor = .carbon
        collectionView.bounces = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let imageView: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: cell.frame.width, height: cell.frame.height) )
        let image: UIImage = UIImage(named: "salesBanner")!
        imageView.image = image
        cell.contentView.layer.cornerRadius = 10
        cell.contentView.layer.masksToBounds = true
//        cell.backgroundColor = .orange
        cell.contentView.addSubview(imageView)
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
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        ])
    }
}

//import UIKit
//
//protocol SalesCellDelegate: AnyObject {
//    func didTapCollectionViewCell(with model: SaleModel)
//}
//
//final class SalesCell: UITableViewCell {
//
//    private lazy var collectionView: UICollectionView = {
//
//        let layout = UICollectionViewFlowLayout()
////        layout.itemSize = CGSize(width: 310, height: 106)
////        layout.minimumLineSpacing = 16
////        layout.minimumInteritemSpacing = 0
////        layout.scrollDirection = .horizontal
////        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
////        let collectionView = UICollectionView()
//
////        collectionView.showsHorizontalScrollIndicator = false
////        collectionView.collectionViewLayout = layout
//        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
//
//        //        collectionView.delegate = self
//        //        collectionView.dataSource = self
//
//        return collectionView
//    }()
//
//    private var sales: [SaleModel] = [
//        SaleModel(id: "123", imageUrl: "123", title: "123", promocode: "123"),
//        SaleModel(id: "123", imageUrl: "123", title: "123", promocode: "123"),
//        SaleModel(id: "123", imageUrl: "123", title: "123", promocode: "123"),
//        SaleModel(id: "123", imageUrl: "123", title: "123", promocode: "123")
//    ]
//
//    weak var delegate: SalesCellDelegate?
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//
//        setupCell()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
//
//// MARK: - UICollectionViewDataSource Impl
//
//extension SalesCell: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return sales.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
//        let imageView: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: cell.frame.width, height: cell.frame.height) )
//        let image: UIImage = UIImage(named: "salesBanner")!
//        imageView.image = image
//        cell.backgroundColor = .blue
//        cell.contentView.layer.cornerRadius = 10
//        cell.contentView.layer.masksToBounds = true
//
//        cell.contentView.addSubview(imageView)
//        return cell
//    }
//}
//
//// MARK: - UICollectionViewDelegate Impl
//
//extension SalesCell: UICollectionViewDelegate {
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
//        let sale = sales[indexPath.item]
//        delegate?.didTapCollectionViewCell(with: sale)
//    }
//}
//
//// MARK: - Public methods
//
//extension SalesCell {
//
//    func setupCell(with model: [SaleModel]) {
//        sales = model
//        collectionView.reloadData()
//    }
//}
//
//// MARK: - Private methods
//
//private extension SalesCell {
//    func setupCell() {
//
//        backgroundColor = .lightGray
//
//        addSubviews()
//        setConstraints()
//    }
//
//    func addSubviews() {
//        contentView.myAddSubView(collectionView)
//    }
//
//    func setConstraints() {
//        NSLayoutConstraint.activate([
//            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
//            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
//            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
//            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
//        ])
//    }
//}
