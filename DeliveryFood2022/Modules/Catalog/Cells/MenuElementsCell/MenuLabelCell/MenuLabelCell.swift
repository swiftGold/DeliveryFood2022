//
//  MenuLabelCell.swift
//  DeliveryFood2022
//
//  Created by Сергей Золотухин on 15.09.2022.
//

import UIKit

class MenuLabelCell: UICollectionViewCell {
    
    private let menuLabel: WhiteLabelRubikMedium14 = {
        let label = WhiteLabelRubikMedium14()
        label.text = ""
        label.textAlignment = .center
        return label
    }()
    
//    override var isSelected: Bool {
//        didSet {
//            if self.isSelected {
//                backgroundColor = .signalYellow
//                layer.cornerRadius = 10
//                menuLabel.textColor = .specialBlack
//            } else {
//                backgroundColor = .clear
//                menuLabel.textColor = .specialWhite
//            }
//        }
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//extension MenuLabelCell {
//    func cellConfig(menuElementsArray: [String], indexPath: IndexPath) {
//        menuLabel.text = menuElementsArray[indexPath.item]
//    }
//}

extension MenuLabelCell {
    func cellConfig(_ viewModel: MenuElementsModel) {
        menuLabel.text = viewModel.text
        menuLabel.textColor = viewModel.isSelected ? .specialBlack : .specialWhite
        menuLabel.backgroundColor = viewModel.isSelected ? .signalYellow : .clear
    }
}

// MARK: - Private methods

private extension MenuLabelCell {
    func setupCell() {
        
        addSubviews()
        setConstraints()
    }
    
    func addSubviews() {
        myAddSubView(menuLabel)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            menuLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            menuLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            menuLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            menuLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        ])
    }
}
