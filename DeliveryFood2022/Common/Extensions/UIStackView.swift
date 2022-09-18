//
//  UIStackView.swift
//  DeliveryFood2022
//
//  Created by Сергей Золотухин on 14.09.2022.
//

import UIKit

extension UIStackView {
    convenience init(arrangedSubViews: [UIView],
                     axis: NSLayoutConstraint.Axis,
                     spacing: CGFloat,
                     distribution: UIStackView.Distribution) {
        self.init(arrangedSubviews: arrangedSubViews)
        self.axis = axis
        self.spacing = spacing
        self.distribution = distribution
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

