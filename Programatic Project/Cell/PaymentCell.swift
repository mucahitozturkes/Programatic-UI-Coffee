//
//  PaymentCell.swift
//  Programatic Project
//
//  Created by mücahit öztürk on 12.03.2024.
//

import UIKit

class PaymentCell: UITableViewCell {

    static let reuseID = "PaymentCell"
    
    let discountButton  = GFLabelButton(backgroundColor: .white, title: "1 Discount is applied", cornerR: 12)
    let line            = GFImageView(frame: .zero)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureLine()
        configureDiscountButton()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }
    
    func configureLine() {
        addSubview(line)
        
        line.backgroundColor = UIColor(named: "line")
        
        NSLayoutConstraint.activate([
            line.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -20),
            line.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 20),
            line.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            line.heightAnchor.constraint(equalToConstant: 4)
        ])
    }
    
    
    func configureDiscountButton() {
        addSubview(discountButton)
        
        discountButton.layer.borderWidth = 1
        discountButton.layer.borderColor = UIColor(named: "line")?.cgColor
        discountButton.titleLabel?.textColor = .black
        
        NSLayoutConstraint.activate([
            discountButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            discountButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            discountButton.topAnchor.constraint(equalTo: line.bottomAnchor, constant: 16),
            discountButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }

}
