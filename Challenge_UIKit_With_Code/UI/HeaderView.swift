//
//  UIHeaderView.swift
//  Challenge_UIKit_With_Code
//
//  Created by Дмирий Зядик on 08.12.2024.
//

import UIKit


class HeaderView: UIView {
    
    
    let textDict: [[String]] = [["Знак зодиака", "Асцендент",
                                 boris.zodiac, boris.ascendant],
                                ["Стихия", "Цвет",
                                 boris.element, boris.color],
                                ["Камень", "Планета",
                                 boris.stone, boris.planet]]
    
    private lazy var columnStack : UIStackView = {
        let v = UIStackView()
        v.axis = .vertical
        v.distribution = .equalCentering
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    private lazy var imageMain : UIImageView = {
        let v = UIImageView()
        v.image = UIImage(named: "babyface")
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func configureColumnStack(){
        
        textDict.forEach(
            {
                columnStack.addArrangedSubview(UIStackView.init(axis: .horizontal, distribution: .equalSpacing, alignment: .center, spacing: .zero, subViews: [
                    
                    UIStackView.init(axis: .vertical, distribution: .fill, alignment: .fill, spacing: 3, subViews: [
                        UILabel.makeLabel(text: $0[0], font: .systemFont(ofSize: 14), textColor: UIColor(named: K.brandColors.brandMain)!, textAligment: .left),
                        UILabel.makeLabel(text: $0[2], font: .systemFont(ofSize: 14), textColor: UIColor(named: K.brandColors.brandText)!,  textAligment: .left)
                    ]),
                    UIStackView.init(axis: .vertical, distribution: .fill, alignment: .trailing, spacing: 3, subViews: [
                        UILabel.makeLabel(text: $0[1], font: .systemFont(ofSize: 14), textColor: UIColor(named: K.brandColors.brandMain)!,  textAligment: .right),
                        UILabel.makeLabel(text: $0[3], font: .systemFont(ofSize: 14), textColor: UIColor(named: K.brandColors.brandText)!,  textAligment: .right)
                    ])

                ]))
            }
        )
        addSubview(columnStack)        
    }
    
    private func setupView(){
        addSubview(imageMain)
        configureColumnStack()
     
        NSLayoutConstraint.activate([
            imageMain.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageMain.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            columnStack.topAnchor.constraint(equalTo: topAnchor),
            columnStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            columnStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            columnStack.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
