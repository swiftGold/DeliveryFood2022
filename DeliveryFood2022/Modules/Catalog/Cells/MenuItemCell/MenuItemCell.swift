//
//  MenuItemCell.swift
//  DeliveryFood2022
//
//  Created by Сергей Золотухин on 16.09.2022.
//

import UIKit

final class MenuItemCell: UITableViewCell {
    
    private let imageForCell: UIImageView = {
        let imageView = UIImageView()
        var photoImage = UIImage(named: "food")
        imageView.clipsToBounds = true
        imageView.image = photoImage
        return imageView
    }()
    
    private let titleLabel: TitleLabel16 = {
        let label = TitleLabel16()
        label.text = ""
        label.numberOfLines = 0
        return label
    }()
    
    private let descriptionLabel: DescriptionLabel14 = {
        let label = DescriptionLabel14()
        label.text = ""
        label.numberOfLines = 0
        return label
    }()
    
    private let costLabel: WhiteLabelRubikMedium14 = {
        let label = WhiteLabelRubikMedium14()
        label.text = ""
        return label
    }()

    private lazy var addProductButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 10
        button.setBackgroundImage(UIImage(named: "addtocart.png"), for: .normal)
        button.addTarget(self, action: #selector(addProductButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    @objc private func addProductButtonTapped() {
        print("Add product")
    }
}

extension MenuItemCell {
    func cellConfig(_ viewModel: MenuItemsModel) {
        titleLabel.text = viewModel.nameLabelText
        descriptionLabel.text = viewModel.descriptionLabelText
        costLabel.text = viewModel.costLabelText
    }
}

// MARK: - Private methods

private extension MenuItemCell {
    func setupCell() {
        backgroundColor = .carbon
        selectionStyle = .none

        addSubviews()
        setConstraints()
    }
    
    func addSubviews() {
        
        addSubview(contentView)
        myAddSubView(imageForCell)
        myAddSubView(titleLabel)
        myAddSubView(descriptionLabel)
        myAddSubView(costLabel)
        myAddSubView(addProductButton)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            imageForCell.topAnchor.constraint(equalTo: topAnchor, constant: 26),
            imageForCell.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -8),
            imageForCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            imageForCell.widthAnchor.constraint(equalToConstant: 100),
            imageForCell.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: imageForCell.trailingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: imageForCell.trailingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            addProductButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            addProductButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            addProductButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            addProductButton.widthAnchor.constraint(equalToConstant: 32),
            addProductButton.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        NSLayoutConstraint.activate([
            costLabel.leadingAnchor.constraint(equalTo: imageForCell.trailingAnchor, constant: 16),
            costLabel.centerYAnchor.constraint(equalTo: addProductButton.centerYAnchor)
        ])
    }
}
