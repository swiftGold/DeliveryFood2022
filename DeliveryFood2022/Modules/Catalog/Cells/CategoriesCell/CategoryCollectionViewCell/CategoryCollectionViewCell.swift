//
//  CategoryCollectionViewCell.swift
//  DeliveryFood2022
//
//  Created by Сергей Золотухин on 15.09.2022.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    private let titleLabel: WhiteLabelRubikMedium14 = {
        let label = WhiteLabelRubikMedium14()
        label.text = ""
        label.textAlignment = .center
        label.layer.cornerRadius = 16
        label.clipsToBounds = true
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(with viewModel: CategoryCellViewModel) {
        titleLabel.text = viewModel.title
        titleLabel.textColor = viewModel.isSelected ? .specialBlack : .specialWhite
        titleLabel.backgroundColor = viewModel.isSelected ? .signalYellow : .clear
    }
}

// MARK: - Private methods

private extension CategoryCollectionViewCell {
    func setupCell() {
        addSubviews()
        setConstraints()
    }
    
    func addSubviews() {
        contentView.myAddSubView(titleLabel)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
