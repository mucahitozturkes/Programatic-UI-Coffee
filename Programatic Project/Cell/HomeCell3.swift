//
//  HomeCellCV.swift
//  Programatic Project
//
//  Created by mücahit öztürk on 4.03.2024.
//

import UIKit

class HomeCell3: UICollectionViewCell {

    static let reuseID = "HomeCell3"
    
    let mainView            = GFView()
    let imageView           = GFImageView(frame: .zero)
    let imageViewStar       = GFImageView(frame: .zero)
    let textLabelNumbers    = GFTitleLabel(textAlignment: .left, fontSize: 10, textColor: .white)
    let textTitle           = GFTitleLabel(textAlignment: .left, fontSize: 18, textColor: .black)
    let secondaryLabel      = GFTitleLabel(textAlignment: .left, fontSize: 14, textColor: .lightGray)
    let priceText           = GFTitleLabel(textAlignment: .left, fontSize: 18, textColor: .black)
    let addButton           = GFLabelButton(backgroundColor: UIColor(named: "titleCell") ?? .brown, title: "", cornerR: 8)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCV()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(_ item: ListItem, products: productList) {
        textTitle.text              = item.title
        imageView.image             = UIImage(named: products.image)
        imageViewStar.image         = UIImage(systemName: "star.fill")?.withTintColor(.systemYellow, renderingMode: .alwaysOriginal)
        textLabelNumbers.text       = "\(products.vote)"
        textTitle.text              = products.title
        secondaryLabel.text         = products.secondaryTitle
        priceText.text              = "$ \(products.price)"
        addButton.setImage(UIImage(systemName: "plus"),for: .normal)
    }
    
    
    func configureCV() {
        addSubview(mainView)
        mainView.addSubview(imageView)
        mainView.addSubview(imageViewStar)
        mainView.addSubview(textLabelNumbers)
        mainView.addSubview(textTitle)
        mainView.addSubview(secondaryLabel)
        mainView.addSubview(priceText)
        mainView.addSubview(addButton)
        
        mainView.backgroundColor = .white
        mainView.layer.cornerRadius = 12
        mainView.layer.shadowColor = UIColor.black.cgColor
        mainView.layer.shadowOpacity = 0.1
        mainView.layer.shadowOffset = CGSize(width: 0, height: 2)
        mainView.layer.shadowRadius = 5
        mainView.layer.masksToBounds = false
        
        secondaryLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .light)
        
        priceText.font = UIFont.systemFont(ofSize: 18.0, weight: .medium)
        
        addButton.tintColor = UIColor.white
     
       
       
        
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: topAnchor),
            mainView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 132),
            
            imageViewStar.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            imageViewStar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            imageViewStar.heightAnchor.constraint(equalToConstant: 15),
            imageViewStar.widthAnchor.constraint(equalToConstant: 15),
            
            textLabelNumbers.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            textLabelNumbers.leadingAnchor.constraint(equalTo: imageViewStar.trailingAnchor, constant: 3),
            
            textTitle.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 12),
            textTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            
            secondaryLabel.topAnchor.constraint(equalTo: textTitle.bottomAnchor, constant: 8),
            secondaryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            
            priceText.topAnchor.constraint(equalTo: secondaryLabel.bottomAnchor, constant: 12),
            priceText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            addButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            addButton.heightAnchor.constraint(equalToConstant: 32),
            addButton.widthAnchor.constraint(equalToConstant: 32),
    
        ])
      }
    
}

