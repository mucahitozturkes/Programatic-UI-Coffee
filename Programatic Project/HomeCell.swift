//
//  HomeCell.swift
//  Programatic Project
//
//  Created by mücahit öztürk on 28.02.2024.
//

import UIKit

struct List: Codable {
    var test: String
}

class HomeCell: UITableViewCell {

    static let reuseID = "HomeCell"
    
    var testLabel = GFTitleLabel(textAlignment: .left, fontSize: 20)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(list: List) {
        testLabel.text = list.test
    }
    
    
    private func configure() {
        addSubview(testLabel)
       
        let padding: CGFloat = 32
               
        NSLayoutConstraint.activate([
            testLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            testLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            testLabel.heightAnchor.constraint(equalToConstant: 60)
            
        ])
    }
    
}
