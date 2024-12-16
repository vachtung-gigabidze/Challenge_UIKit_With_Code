//
//  TraitView.swift
//  Challenge_UIKit_With_Code
//
//  Created by Дмирий Зядик on 12.12.2024.
//

import UIKit


class TraitView : UIView {    
    
    // MARK: - UI
    
    private lazy var labelView : UILabel = {
        let v = UILabel()
        v.textColor = UIColor(named: K.brandColors.brandMain)
        v.font = .systemFont(ofSize: 14, weight: .regular)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    private lazy var progressView : UIProgressView = {
        let v = UIProgressView(progressViewStyle: .bar)
        v.trackTintColor = UIColor(named: K.brandColors.progressSecond)
        v.progressTintColor = UIColor(named: K.brandColors.progressMain)
        v.transform = v.transform.scaledBy(x: 1, y: 2)
        v.layer.cornerRadius = 2
         v.clipsToBounds = true
         v.layer.sublayers![1].cornerRadius = 2
         v.subviews[1].clipsToBounds = true
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    private lazy var progressLabel : UILabel = {
        let v = UILabel()
        v.textColor = UIColor(named: K.brandColors.brandMain)
        v.font = .systemFont(ofSize: 13, weight: .light)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    private lazy var columnStack = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    public func configure(progress : Float, label: String ){
        progressView.progress = progress / 10
        labelView.text = label
        progressLabel.text = "\(progress) / 10"
    }
    
    private func setupView(){
        columnStack = UIStackView.init(axis: .vertical, distribution: .fill, alignment: .fill, spacing: 10, subViews: [labelView, progressView, progressLabel])
        addSubview(columnStack)
        NSLayoutConstraint.activate([
            columnStack.topAnchor.constraint(equalTo: topAnchor),
            columnStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            columnStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            columnStack.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
