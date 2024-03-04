//
//  HomeCell3.swift
//  Programatic Project
//
//  Created by mücahit öztürk on 3.03.2024.
//

import UIKit

class HomeCell3: UITableViewCell {

    static let reuseID = "HomeCell3"
    
    var testView  = GFView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureSection1()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set3(responseCell: String) {
        
       
    }
    
    
    private func configureSection1() {
        addSubview(testView)
        
        testView.backgroundColor = .red
               
        NSLayoutConstraint.activate([
            testView.topAnchor.constraint(equalTo: contentView.topAnchor),
            testView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            testView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            testView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
         
        ])
    }

}
