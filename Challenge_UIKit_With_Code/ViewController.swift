//
//  ViewController.swift
//  Challenge_UIKit_With_Code
//
//  Created by Дмирий Зядик on 08.12.2024.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - UI

    private lazy var headerLabel : UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    private lazy var scrollView : UIScrollView = {
        let v = UIScrollView()
        v.backgroundColor = .white
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
    
    private lazy var nameLabel : UILabel = {
        let v = UILabel()
        v.text = "Ковальчук Борис Федорович"
        v.font = .systemFont(ofSize: 18, weight: .regular)
        v.textColor = UIColor(named: K.brandColors.brandMain)
        v.textAlignment = .center
        
        v.layer.borderColor = UIColor(named: K.brandColors.brandMain)?.cgColor
        v.layer.borderWidth = 1.0
        v.layer.cornerRadius = 10.0
        v.layer.masksToBounds = true
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    private lazy var headerView : HeaderView = {
        let v = HeaderView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    private lazy var haracterLabel : UILabel = {
        let v = UILabel()
        v.text = "Черты характера"
        v.text = "Борис"
        v.font = .systemFont(ofSize: 24, weight: .regular)
        v.textColor = .brandMain
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstrains()
    }
    
    func setupView(){
        view.addSubview(scrollView)
        
        configureScrollView()
        configureHeader()
        
    }
    
    // MARK: - UI Configure
    
    func configureScrollView(){
        view.layer.shadowColor = UIColor(named: K.brandColors.brandGradientBegin)?.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 10
        
        scrollView.layer.cornerRadius = 30.0
        scrollView.layer.masksToBounds = true
    }
    
    
    func configureHeader(){
        headerLabel.text = "Борис"
        headerLabel.font = .systemFont(ofSize: 24, weight: .regular)
        headerLabel.textColor = .brandMain
        
        scrollView.addSubview(heartImage)
        scrollView.addSubview(headerLabel)
        scrollView.addSubview(closeImage)
        scrollView.addSubview(curveImage)
        scrollView.addSubview(nameLabel)
        scrollView.addSubview(headerView)
    }
}

extension ViewController {
    
    private func setConstrains() {
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -28),
            
            headerLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            headerLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            heartImage.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            heartImage.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 22),
            heartImage.heightAnchor.constraint(equalToConstant: 25),
            heartImage.widthAnchor.constraint(equalToConstant: 25),
            
            closeImage.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            closeImage.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: view.bounds.width-56),
            closeImage.heightAnchor.constraint(equalToConstant: 20),
            closeImage.widthAnchor.constraint(equalToConstant: 20),
            
            curveImage.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 7),
            curveImage.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            curveImage.heightAnchor.constraint(equalToConstant: 5),
            curveImage.widthAnchor.constraint(equalToConstant: 86),
            

            nameLabel.topAnchor.constraint(equalTo: curveImage.bottomAnchor, constant: 10),
            nameLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 40),
            nameLabel.widthAnchor.constraint(equalToConstant: 280),
            
            headerView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            headerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 28),
            //headerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            headerView.widthAnchor.constraint(equalToConstant: view.bounds.width - 78),
            headerView.heightAnchor.constraint(equalToConstant: 160),
            
        ])
    }
}


#Preview {
    let vc = ViewController()
    return vc
}

