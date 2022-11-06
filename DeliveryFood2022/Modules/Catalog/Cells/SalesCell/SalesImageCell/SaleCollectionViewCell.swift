//
//  SaleCollectionViewCell.swift
//  DeliveryFood2022
//
//  Created by Сергей Золотухин on 20.09.2022.
//

import UIKit

final class SaleCollectionViewCell: UICollectionViewCell {
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(asset: Asset.Assets.salesBanner)
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.backgroundColor = .green
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(with viewModel: SaleCellViewModel) {
        loadImageFromUrl(imageURL: viewModel.imageUrl, imageView: imageView)
    }
}

private extension SaleCollectionViewCell {
    func loadImageFromUrl(imageURL: String, imageView: UIImageView) {
        if let url = URL(string: imageURL) {
            do {
                let data = try Data(contentsOf: url)
                self.imageView.image = UIImage(data: data)
            } catch {
                print("Error = ", error.localizedDescription)}
        }
    }
    
    func setupCell() {
        contentView.myAddSubView(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
    }
}
