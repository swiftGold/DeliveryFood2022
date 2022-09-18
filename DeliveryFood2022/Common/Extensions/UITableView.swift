//
//  UITableView.swift
//  DeliveryFood2022
//
//  Created by Сергей Золотухин on 09.09.2022.
//

import UIKit

extension UITableView {
    
    func register(cellTypes: [UITableViewCell.Type]) {
        cellTypes.forEach( { self.register($0.nib, forCellReuseIdentifier: $0.reuseIdentifier)
        })
    }
    
    func register(cellTypes: UITableViewCell.Type...) {
        cellTypes.forEach( { self.register($0.nib, forCellReuseIdentifier: $0.reuseIdentifier)
        })
    }
    
    func register(cellType: UITableViewCell.Type) {
        register(cellType.nib, forCellReuseIdentifier: cellType.reuseIdentifier)
    }
    
//    func register(cellType: UITableViewCell.Type) {
//        register(cellType.init(coder: <#T##NSCoder#>), forCellReuseIdentifier: cellType.reuseIdentifier)
//    }
    
    func dequeueReusableCell<T: UITableViewCell>(withType type: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: type.reuseIdentifier, for: indexPath) as? T else {
            fatalError("\(String(describing: T.self)) not found")
        }
        return cell
    }
}
