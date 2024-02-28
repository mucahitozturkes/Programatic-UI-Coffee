//
//  HomeCell.swift
//  Programatic Project
//
//  Created by mücahit öztürk on 28.02.2024.
//

import UIKit

class HomeCell: UITableViewCell {

    static let reuseID = "HomeCell"
    
    var testLabel = GFTitleLabel(textAlignment: .left, fontSize: 20)
    var testImage = GFImageView(frame: .zero)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(list: List) {
        testLabel.text  = list.test
        testImage.image = UIImage(systemName: "person")
    }
    
    
    private func configure() {
        addSubview(testLabel)
        addSubview(testImage)
       
        let padding: CGFloat = 12
               
        NSLayoutConstraint.activate([
            testLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            testLabel.leadingAnchor.constraint(equalTo: testImage.trailingAnchor, constant: padding),
            testLabel.heightAnchor.constraint(equalToConstant: 60),
            
            testImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            testImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            testImage.heightAnchor.constraint(equalToConstant: 40),
            testImage.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    
}
