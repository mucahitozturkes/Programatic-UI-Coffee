//
//  HomeCell2.swift
//  Programatic Project
//
//  Created by mücahit öztürk on 3.03.2024.
//

import UIKit

class HomeCell2: UITableViewCell {
    static let reuseID = "HomeCell2"
    
    var testLabel = GFTitleLabel(textAlignment: .left, fontSize: 20, textColor: .black)
    var testImage = GFImageView(frame: .zero)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureSection1()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set2(responseCell: String) {
     
    }
    
    
    private func configureSection1() {
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
