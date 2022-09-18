//
//  UIView.swift
//  DeliveryFood2022
//
//  Created by Сергей Золотухин on 09.09.2022.
//

import UIKit

extension UIView {
    
    func myAddSubView(_ view: UIView) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
    }
}
