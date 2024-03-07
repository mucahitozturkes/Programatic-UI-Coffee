//
//  HomeCell2.swift
//  Programatic Project
//
//  Created by mücahit öztürk on 3.03.2024.
//

import UIKit

class HomeCell2: UICollectionViewCell {
    
    static let reuseID = "HomeCell2"
      
    let titleLabel  = UILabel()
    let textView    = UIView()
   
   
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCV()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setup(_ item: ListItem) {
        titleLabel.text             = item.title
    }
    
    
    func configureCV() {
        textView.addSubview(titleLabel)
        addSubview(textView)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.textAlignment    = .center
        titleLabel.textColor        = .white
        titleLabel.font             = UIFont.boldSystemFont(ofSize: 16)
       
        textView.backgroundColor = UIColor(named: "titleCell")
        textView.layer.cornerRadius = 8
        
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: topAnchor),
            textView.leadingAnchor.constraint(equalTo: leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: trailingAnchor),
            textView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
      }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        textView.layer.cornerRadius = 12
        textView.layoutIfNeeded()
    }
}


