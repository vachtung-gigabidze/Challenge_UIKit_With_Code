//
//  ViewController.swift
//  Challenge_UIKit_With_Code
//
//  Created by Дмирий Зядик on 08.12.2024.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - UI
    
    private lazy var backgroundView : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    private lazy var headerLabel : UILabel = {
        let v = UILabel()
        v.text = boris.firstName
        v.font = .systemFont(ofSize: 24, weight: .regular)
        v.numberOfLines = 0
        v.textColor = .brandMain
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    private lazy var scrollView : UIScrollView = {
        let v = UIScrollView()
        v.backgroundColor = .white
        v.showsVerticalScrollIndicator = false
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    private lazy var heartImage : UIImageView = {
        let v = UIImageView()
        v.image = UIImage(named: "heart")
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    private lazy var closeImage : UIImageView = {
        let v = UIImageView()
        v.image = UIImage(named: "close")
        
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    private lazy var curveImage : UIImageView = {
        let v = UIImageView()
        v.image = UIImage(named: "curve_line")
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    private lazy var nameLabel : PaddingLabel = {
        let v = PaddingLabel(withInsets: 10, 10, 20, 20)
        v.text = "\(boris.lastName) \(boris.firstName) \(boris.midleName)"
        v.font = .systemFont(ofSize: 18, weight: .regular)
        v.textColor = UIColor(named: K.brandColors.brandMain)
        v.numberOfLines = 0
        v.textAlignment = .center
        v.layer.borderColor = UIColor(named: K.brandColors.brandSecond)?.cgColor
        v.layer.borderWidth = 2.0
        v.layer.cornerRadius = 12.0
        v.layer.masksToBounds = true
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    private lazy var headerView : HeaderView = {
        let v = HeaderView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    private lazy var characterLabel : UILabel = {
        let v = UILabel()
        v.text = "Черты характера"
        v.font = .systemFont(ofSize: 18, weight: .regular)
        v.textColor = .brandMain
            
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    private lazy var trait1View : TraitView = {
        let v = TraitView()
        v.configure(progress: boris.luck, label: "Удача")
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    private lazy var trait2View : TraitView = {
        let v = TraitView()
        v.configure(progress: boris.kind, label: "Доброта")
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    private lazy var trait3View : TraitView = {
        let v = TraitView()
        v.configure(progress: boris.wisdom, label: "Ум")
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    private var headerStack = UIStackView()
    
    private var traitStack = UIStackView()
    
    private var contentStack = UIStackView()
    
    private lazy var descriptionLabel : UILabel = {
        let v = UILabel()
        v.text = "Описание"
        v.font = .systemFont(ofSize: 18, weight: .regular)
        v.textColor = .brandMain
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    private lazy var descriptionText : UILabel = {
        let v = UILabel()
        v.text = boris.description
        v.textColor = .brandText
        v.font = .systemFont(ofSize: 14, weight: .regular)
        
        v.numberOfLines = 0
            
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    private lazy var astrologyLabel : UILabel = {
        let v = UILabel()
        v.text = "Астрология"
        v.font = .systemFont(ofSize: 18, weight: .regular)
        v.textColor = .brandMain
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    private lazy var astrologyText : UILabel = {
        let v = UILabel()
        v.text = boris.atrology
        v.textColor = .brandText
        v.font = .systemFont(ofSize: 14, weight: .regular)
        v.numberOfLines = 0
       
            
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    private lazy var nameMeaningLabel : UILabel = {
        let v = UILabel()
        v.text = "Значение имени"
        v.font = .systemFont(ofSize: 18, weight: .regular)
        v.textColor = .brandMain
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    private lazy var nameMeaningText : UILabel = {
        let v = UILabel()
        v.text = boris.nameMeaning
        v.textColor = .brandText
        v.font = .systemFont(ofSize: 14, weight: .regular)
        v.numberOfLines = 0
        
            
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    private lazy var watermarkDuckImage : UIImageView = {
        let v = UIImageView()
        v.image = UIImage(named: "duck_watermark")
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    private lazy var watermarkStarImage : UIImageView = {
        let v = UIImageView()
        v.image = UIImage(named: "stars_watermark")
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    private lazy var watermarkTeddyImage : UIImageView = {
        let v = UIImageView()
        v.image = UIImage(named: "teddy_watermark")
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstrains()
    }
    
    func setupView(){
        configureScrollView()
    }
    
    // MARK: - UI Configure
    
    func configureScrollView(){

        backgroundView.layer.shadowColor = UIColor(named: K.brandColors.brandGradientBegin)?.cgColor
        backgroundView.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        backgroundView.layer.shadowOpacity = 1
        backgroundView.layer.shadowRadius = 10
        
        view.backgroundColor = .brandBackground
        view.addSubview(backgroundView)
        
        traitStack = UIStackView.init(axis: .horizontal, distribution: .equalSpacing, alignment: .center, spacing: 0, subViews: [trait1View, trait2View, trait3View])
        
        headerStack = UIStackView.init(axis: .horizontal, distribution: .equalSpacing, alignment: .fill, spacing: 0, subViews: [heartImage, headerLabel, closeImage])
        
        contentStack = UIStackView.init(axis: .vertical, distribution: .fill, alignment: .center, spacing: 0, subViews: [headerStack, curveImage, nameLabel, headerView, characterLabel, traitStack, descriptionLabel, descriptionText, astrologyLabel, astrologyText, nameMeaningLabel,nameMeaningText ])
        
        contentStack.setCustomSpacing(7, after: headerStack)
        contentStack.setCustomSpacing(14, after: curveImage)
        contentStack.setCustomSpacing(37, after: nameLabel)
        contentStack.setCustomSpacing(48, after: headerView)
        contentStack.setCustomSpacing(16, after: characterLabel)
        contentStack.setCustomSpacing(36, after: traitStack)
        contentStack.setCustomSpacing(12, after: descriptionLabel)
        contentStack.setCustomSpacing(36, after: descriptionText)
        contentStack.setCustomSpacing(16, after: astrologyLabel)
        contentStack.setCustomSpacing(36, after: astrologyText)
        contentStack.setCustomSpacing(16, after: nameMeaningLabel)
        contentStack.setCustomSpacing(36, after: nameMeaningText)
        contentStack.backgroundColor = .none
        
        backgroundView.addSubview(scrollView)
        
        scrollView.layer.cornerRadius = 30.0
        scrollView.layer.masksToBounds = true
        scrollView.backgroundColor = .brandBackground
       
        scrollView.addSubview(contentStack)
        
        scrollView.addSubview(watermarkDuckImage)
        scrollView.addSubview(watermarkStarImage)
        scrollView.addSubview(watermarkTeddyImage)
    }
   
}

extension ViewController {
    
    private func setConstrains() {
        
        NSLayoutConstraint.activate([
            
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            backgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),

            scrollView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 10),
            scrollView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 10),
            scrollView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -10),
            scrollView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -20),
            
            contentStack.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 19),
            contentStack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
            contentStack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentStack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
          
            headerStack.leadingAnchor.constraint(equalTo: contentStack.leadingAnchor, constant: 22),
            headerStack.trailingAnchor.constraint(equalTo: contentStack.trailingAnchor,constant: -22),
          
            heartImage.heightAnchor.constraint(equalToConstant: 25),
            heartImage.widthAnchor.constraint(equalToConstant: 25),
            closeImage.heightAnchor.constraint(equalToConstant: 25),
            closeImage.widthAnchor.constraint(equalToConstant: 25),

            curveImage.centerXAnchor.constraint(equalTo: contentStack.centerXAnchor),
            curveImage.heightAnchor.constraint(equalToConstant: 5),
            curveImage.widthAnchor.constraint(equalToConstant: 86),

            headerView.leadingAnchor.constraint(equalTo: contentStack.leadingAnchor, constant: 28),
            headerView.trailingAnchor.constraint(equalTo: contentStack.trailingAnchor, constant: -28),
            headerView.heightAnchor.constraint(equalToConstant: 160),
    
            traitStack.leadingAnchor.constraint(equalTo: contentStack.leadingAnchor, constant: 28),
            traitStack.widthAnchor.constraint(equalToConstant: view.bounds.width - 78),
            trait1View.heightAnchor.constraint(equalToConstant: 57),
            trait1View.widthAnchor.constraint(equalToConstant: 80),
            trait2View.heightAnchor.constraint(equalToConstant: 57),
            trait2View.widthAnchor.constraint(equalToConstant: 80),
            trait3View.heightAnchor.constraint(equalToConstant: 57),
            trait3View.widthAnchor.constraint(equalToConstant: 80),
            
            watermarkDuckImage.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 620.31),
            watermarkDuckImage.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            watermarkDuckImage.heightAnchor.constraint(equalToConstant: 132),
            watermarkDuckImage.widthAnchor.constraint(equalToConstant: 129.47),
            
            watermarkStarImage.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 760),
            watermarkStarImage.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            watermarkStarImage.heightAnchor.constraint(equalToConstant: 168),
            watermarkStarImage.widthAnchor.constraint(equalToConstant: 150),
            
            watermarkTeddyImage.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 80),
            watermarkTeddyImage.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            watermarkTeddyImage.heightAnchor.constraint(equalToConstant: 168),
            watermarkTeddyImage.widthAnchor.constraint(equalToConstant: 150),

            descriptionText.centerXAnchor.constraint(equalTo: contentStack.centerXAnchor),
            descriptionText.leadingAnchor.constraint(equalTo: contentStack.leadingAnchor, constant: 28),
            descriptionText.widthAnchor.constraint(equalToConstant: view.bounds.width - 78),

            astrologyText.centerXAnchor.constraint(equalTo: contentStack.centerXAnchor),
            astrologyText.leadingAnchor.constraint(equalTo: contentStack.leadingAnchor, constant: 28),
            astrologyText.widthAnchor.constraint(equalToConstant: view.bounds.width - 78),

            nameMeaningText.centerXAnchor.constraint(equalTo: contentStack.centerXAnchor),
            nameMeaningText.leadingAnchor.constraint(equalTo: contentStack.leadingAnchor, constant: 28),
            nameMeaningText.widthAnchor.constraint(equalToConstant: view.bounds.width - 78),
        ])
    }
}



//#Preview {
//    let vc = ViewController()
//    return vc
//}

