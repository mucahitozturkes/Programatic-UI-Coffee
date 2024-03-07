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
        titleLabel.textColor        = .black
        titleLabel.font             = UIFont.systemFont(ofSize: 16, weight: .light)
       
        
        textView.layer.shadowColor = UIColor.black.cgColor
        textView.layer.shadowOpacity = 0.1
        textView.layer.shadowOffset = CGSize(width: 0, height: 2)
        textView.layer.shadowRadius = 3
        textView.layer.masksToBounds = false
        
        textView.backgroundColor = .white
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
    
    override var isSelected: Bool {
            didSet {
                updateSelectionAppearance()
            }
        }
    
    func updateSelectionAppearance() {
           if isSelected {
               textView.backgroundColor = UIColor(named: "buttoncolor")
               titleLabel.font      = UIFont.systemFont(ofSize: 16, weight: .medium)
               titleLabel.textColor = .white
           } else {
               textView.backgroundColor = .white
               titleLabel.textColor = .black
               titleLabel.font             = UIFont.systemFont(ofSize: 16, weight: .light)
           }
       }
}


