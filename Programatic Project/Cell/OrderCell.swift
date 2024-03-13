//
//  FooterCell.swift
//  Programatic Project
//
//  Created by mücahit öztürk on 12.03.2024.
//

import UIKit

class OrderCell: UITableViewCell {
    
    static let reuseID  = "OrderCell"
    
    var footerView      = GFView(backgroundColor: .white, cornerRadius: 36, borderWidth: 0)
    var orderButton     = GFLabelButton(backgroundColor: UIColor(named: "buttoncolor") ?? .red, title: "Order", cornerR: 16)
    var stackViewMain   = GFStackView(space: 5, distribution: .equalCentering, axis: .horizontal)
    var stackViewIn     = GFStackView(space: 5, distribution: .equalSpacing, axis: .horizontal)
    lazy var doteButton      = GFLabelButton()
    var imageViewPhoto  = GFImageView(frame: .zero)
    var cashLabel       = GFTitleLabel(textAlignment: .center, fontSize: 12, textColor: .white)
    var cashLabelPrice  = GFTitleLabel(textAlignment: .center, fontSize: 12, textColor: .black)
    var stackViewCash   = GFStackView(space: 0, distribution: .fillProportionally, axis: .horizontal)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureFooter()
        configureOrderButton()
        configureStackViews()
        contentView.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
    func configureFooter() {
        addSubview(footerView)
        
        footerView.layer.shadowColor = UIColor.lightGray.cgColor
        footerView.layer.shadowOpacity = 0.2
        footerView.layer.shadowOffset = CGSize(width: 0, height: -8)
        footerView.layer.shadowRadius = 8
        footerView.layer.masksToBounds = false
        
        NSLayoutConstraint.activate([
            footerView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            footerView.heightAnchor.constraint(equalToConstant: 161),
            footerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            footerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            footerView.bottomAnchor.constraint(equalTo: bottomAnchor),
          
        ])
    }
    
    
    func configureOrderButton() {
        footerView.addSubview(orderButton)
        
        orderButton.addTarget(self, action: #selector(orderButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            orderButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
            orderButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            orderButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            orderButton.heightAnchor.constraint(equalToConstant: 62)
            
        ])
    }
    
    @objc func orderButtonTapped() {
        print("ordered")
    }
    
    func configureStackViews() {
        stackViewCash.addArrangedSubview(cashLabel)
        stackViewCash.addArrangedSubview(cashLabelPrice)
        stackViewCash.backgroundColor = UIColor(named: "secondTitle")
        stackViewCash.layer.cornerRadius = 13
        cashLabel.text = "Cash"
        cashLabel.backgroundColor = UIColor(named: "titleCell")
        cashLabel.clipsToBounds = true
        cashLabel.layer.cornerRadius = 13
        cashLabel.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        
        cashLabelPrice.text = "$ 5.53"
      
        cashLabelPrice.clipsToBounds = true
        cashLabelPrice.layer.cornerRadius = 13
        cashLabelPrice.font = UIFont.systemFont(ofSize: 13, weight: .light)
        
        stackViewIn.addArrangedSubview(imageViewPhoto)
        stackViewIn.addArrangedSubview(stackViewCash)
        
        
        stackViewMain.addArrangedSubview(stackViewIn)
        stackViewMain.addArrangedSubview(doteButton)
        
       
        imageViewPhoto.image = UIImage(named: "cash")
        
        doteButton.setImage(UIImage(systemName: "ellipsis.circle.fill")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 24)), for: .normal)
        doteButton.addTarget(self, action: #selector(doteButonPressed), for: .touchUpInside)
        
        doteButton.layer.cornerRadius = doteButton.frame.size.width / 2
        doteButton.clipsToBounds = true
        doteButton.tintColor = UIColor(named: "dot")
        
        footerView.addSubview(stackViewMain)
        
      
        NSLayoutConstraint.activate([
            stackViewMain.topAnchor.constraint(equalTo: footerView.topAnchor, constant: 16),
            stackViewMain.leadingAnchor.constraint(equalTo: footerView.leadingAnchor, constant: 30),
            stackViewMain.trailingAnchor.constraint(equalTo: footerView.trailingAnchor, constant: -30),
            
            imageViewPhoto.heightAnchor.constraint(equalToConstant: 25),
            imageViewPhoto.widthAnchor.constraint(equalToConstant: 25),
            
            cashLabelPrice.widthAnchor.constraint(equalToConstant: 60),
            cashLabel.widthAnchor.constraint(equalToConstant: 50),
            
            
        ])
    }
    
    @objc func doteButonPressed() {
        print("More Info Request")
    }
}
