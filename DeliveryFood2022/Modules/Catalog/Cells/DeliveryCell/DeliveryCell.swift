//
//  DeliveryCell.swift
//  DeliveryFood2022
//
//  Created by Сергей Золотухин on 14.09.2022.
//

import UIKit

final class DeliveryCell: UITableViewCell {
    
    private let view: UIView = {
        let view = UIView()
        view.backgroundColor = .specialBackground
        view.layer.cornerRadius = 15
        return view
    }()
    
    private let chooseView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialBlack
        view.layer.cornerRadius = 15
        return view
    }()
    
    //https://russianblogs.com/article/83031076614/ работа с сегмент контрол
//    private lazy var segmentedControl: UISegmentedControl = {
//        let segmentedControl = UISegmentedControl()
//        segmentedControl.insertSegment(withTitle: "Доставка", at: 0, animated: false)
//        segmentedControl.insertSegment(withTitle: "Самовывоз", at: 1, animated: false)
//        segmentedControl.selectedSegmentIndex = 0
//        segmentedControl.backgroundColor = .specialBlack
//        segmentedControl.selectedSegmentTintColor = .specialWhite
//        let font = UIFont(name: "Rubik-Medium", size: 14)
//        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: font as Any,
//                                                 NSAttributedString.Key.foregroundColor: UIColor.specialLightGray],
//                                                for: .normal)
//        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: font as Any,
//                                                 NSAttributedString.Key.foregroundColor: UIColor.black],
//                                                for: .selected)
//        segmentedControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
//        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
//        return segmentedControl
//    }()
    
    //https://ru.stackoverflow.com/questions/965433/swift-uisegmentedcontrol стэквью с кнопками
    
    private lazy var deliveryButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .specialWhite
        button.setTitle("Доставка", for: .normal)
        button.titleLabel?.font = UIFont(name: "Rubik-Medium", size: 14)
        button.tintColor = .carbon
        button.addTarget(self, action: #selector(deliveryButtonTapped), for: .touchUpInside)
        button.imageEdgeInsets = UIEdgeInsets(top: 6,
                                              left: 0,
                                              bottom: 0,
                                              right: 50)
        button.titleEdgeInsets = UIEdgeInsets(top: 2,
                                              left: 0,
                                              bottom: 0,
                                              right: 0)
        button.setImage(UIImage(named: "deliveryImage"), for: .normal)
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var takeToGoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Самовывоз", for: .normal)
        button.titleLabel?.font = UIFont(name: "Rubik-Medium", size: 14)
        button.tintColor = .specialLightGray
        button.addTarget(self, action: #selector(takeToGoButtonTapped), for: .touchUpInside)
        button.imageEdgeInsets = UIEdgeInsets(top: 6,
                                              left: 0,
                                              bottom: 0,
                                              right: 50)

        button.titleEdgeInsets = UIEdgeInsets(top: 2,
                                              left: 0,
                                              bottom: 0,
                                              right: 0)
        button.setImage(UIImage(named: "takeToGoImage"), for: .normal)
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let adresLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.text = "ул. Центральная, 16"
        label.textColor = .specialWhite
        label.font = UIFont(name: "Rubik-Regular", size: 14)
        return label
    }()
    
    private lazy var changeButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.setTitle("Изменить", for: .normal)
        button.titleLabel?.font = UIFont(name: "Rubik-Regular", size: 14)
        button.tintColor = .signalYellow
        button.addTarget(self, action: #selector(changeButtonTapped), for: .touchUpInside)
        return button
    }()
    
//    private var buttonsStackView = UIStackView()
    private var stack12 = UIStackView()
            
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func deliveryButtonTapped() {
        print(#function)
        takeToGoButton.backgroundColor = .clear
        takeToGoButton.tintColor = .specialLightGray
        deliveryButton.backgroundColor = .specialWhite
        deliveryButton.tintColor = .carbon
    }
    
    @objc
    private func takeToGoButtonTapped() {
        print(#function)
        takeToGoButton.backgroundColor = .specialWhite
        takeToGoButton.tintColor = .carbon
        deliveryButton.backgroundColor = .clear
        deliveryButton.tintColor = .specialLightGray
    }
    
    @objc
    private func changeButtonTapped() {
        print(#function)
    }
    
//    @objc
//    private func segmentChanged() {
//        if segmentedControl.selectedSegmentIndex == 0 {
//            print("1")
//        } else {
//            print("2")
//        }
//    }
}

// MARK: - Private methods

private extension DeliveryCell {
    func setupCell() {
        backgroundColor = .carbon
        
        
                
        addSubviews()
        setConstraints()
        
        stack12 = UIStackView(arrangedSubviews: [deliveryButton, takeToGoButton])
        stack12.axis = .horizontal
        stack12.distribution = .fillEqually // Одинаковые по ширине
        stack12.alignment = .fill // Сверху до низу
        
//        buttonsStackView = UIStackView(arrangedSubViews: [deliveryButton, takeToGoButton],
//                                       axis: .horizontal,
//                                       spacing: 3,
//                                       distribution: .fillEqually)
    }
    
    func addSubviews() {
        contentView.myAddSubView(view)
        view.myAddSubView(chooseView)
//        view.addSubview(buttonsStackView)
        view.myAddSubView(adresLabel)
        view.myAddSubView(changeButton)
        chooseView.myAddSubView(stack12)
        
//        view.addSubview(segmentedControl)
//        view.myAddSubView(buttonsStackView)
//        view.addSubview(buttonsStackView)
        
//        view.myAddSubView(deliveryButton)
//        view.myAddSubView(takeToGoButton)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            view.heightAnchor.constraint(equalToConstant: 106)
        ])
        
//        NSLayoutConstraint.activate([
//            segmentedControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
//            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
//            segmentedControl.heightAnchor.constraint(equalToConstant: 41)
//        ])
        
        NSLayoutConstraint.activate([
            chooseView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            chooseView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            chooseView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            chooseView.heightAnchor.constraint(equalToConstant: 41)
        ])
        
        NSLayoutConstraint.activate([
            stack12.topAnchor.constraint(equalTo: chooseView.topAnchor, constant: 4),
            stack12.trailingAnchor.constraint(equalTo: chooseView.trailingAnchor, constant: -4),
//            stack12.bottomAnchor.constraint(equalTo: chooseView.bottomAnchor, constant: -4),
            stack12.leadingAnchor.constraint(equalTo: chooseView.leadingAnchor, constant: 4)
        ])
        
//        NSLayoutConstraint.activate([
//            buttonsStackView.topAnchor.constraint(equalTo: chooseView.topAnchor, constant: 4),
//            buttonsStackView.trailingAnchor.constraint(equalTo: chooseView.trailingAnchor, constant: -4),
//            buttonsStackView.bottomAnchor.constraint(equalTo: chooseView.bottomAnchor, constant: -4),
//            buttonsStackView.leadingAnchor.constraint(equalTo: chooseView.leadingAnchor, constant: 4)
//        ])
        
//        NSLayoutConstraint.activate([
//            deliveryButton.topAnchor.constraint(equalTo: chooseView.topAnchor, constant: 4),
//            deliveryButton.trailingAnchor.constraint(lessThanOrEqualTo: takeToGoButton.leadingAnchor, constant: -4),
//            deliveryButton.bottomAnchor.constraint(equalTo: chooseView.bottomAnchor, constant: -4),
//            deliveryButton.leadingAnchor.constraint(equalTo: chooseView.leadingAnchor, constant: 4),
//            deliveryButton.widthAnchor.constraint(equalToConstant: CGFloat((chooseView.frame.width / 2) - 6))
//        ])
//
//        NSLayoutConstraint.activate([
//            takeToGoButton.topAnchor.constraint(equalTo: chooseView.topAnchor, constant: 4),
//            takeToGoButton.trailingAnchor.constraint(equalTo: chooseView.trailingAnchor, constant: -4),
//            takeToGoButton.bottomAnchor.constraint(equalTo: chooseView.bottomAnchor, constant: -4),
//            takeToGoButton.leadingAnchor.constraint(equalTo: deliveryButton.trailingAnchor, constant: 4),
//            takeToGoButton.widthAnchor.constraint(equalToConstant: CGFloat((chooseView.frame.width / 2) - 6))
//        ])
        
        NSLayoutConstraint.activate([
            adresLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),
            adresLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            changeButton.centerYAnchor.constraint(equalTo: adresLabel.centerYAnchor),
            changeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
}
