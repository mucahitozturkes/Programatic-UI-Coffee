//
//  PaymentCell.swift
//  Programatic Project
//
//  Created by mücahit öztürk on 12.03.2024.
//

import UIKit

class PaymentCell: UITableViewCell {

    static let reuseID = "PaymentCell"
    
    let line                = GFImageView(frame: .zero)
    
    let discountButton      = GFLabelButton(backgroundColor: .white, title: "1 Discount is applied", cornerR: 12)
    let paymentLabel        = GFTitleLabel(textAlignment: .center, fontSize: 18, textColor: .black)
    let priceLabel          = GFTitleLabel(textAlignment: .left, fontSize: 18, textColor: .black)
    let deliveryLabel       = GFTitleLabel(textAlignment: .left, fontSize: 18, textColor: .black)
    let priceNumber         = GFTitleLabel(textAlignment: .right, fontSize: 18, textColor: .black)
    let deliveryNumber      = GFTitleLabel(textAlignment: .right, fontSize: 18, textColor: .black)
    let deliveryNumberMinus = GFTitleLabel(textAlignment: .right, fontSize: 18, textColor: .black)
    
    let stackViewPrice      = GFStackView(space: 5, distribution: .fill, axis: .horizontal)
    let stackViewDelivery   = GFStackView(space: 5, distribution: .equalCentering, axis: .horizontal)
    let stackViewnumbers    = GFStackView(space: 5, distribution: .equalSpacing, axis: .horizontal)
    
    let spacetor2           = GFImageView(frame: .zero)
    let totalLabel          = GFTitleLabel(textAlignment: .left, fontSize: 18, textColor: .black)
    let totalLabelNum       = GFTitleLabel(textAlignment: .left, fontSize: 18, textColor: .black)
    let stackViewTotal      = GFStackView(space: 5, distribution: .equalSpacing, axis: .horizontal)
    
    let bottomV             = GFView(backgroundColor: .white, cornerRadius: 24, borderWidth: 1)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureLine()
        configureDiscountButton()
        configurepaymentLabel()
        configurePriceLabel()
        configureDeliveryLabel()
        configureSpacetor2()
        configureTotalLabel()
        contentView.isHidden = true       
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    private func configureLine() {
        addSubview(line)
        
        line.backgroundColor = UIColor(named: "space")
        
        NSLayoutConstraint.activate([
            line.leadingAnchor.constraint(equalTo: leadingAnchor),
            line.trailingAnchor.constraint(equalTo: trailingAnchor),
            line.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            line.heightAnchor.constraint(equalToConstant: 4)
        ])
    }
    
    
    private func configureDiscountButton() {
        addSubview(discountButton)
        
        discountButton.layer.borderWidth = 1
        discountButton.layer.borderColor = UIColor(named: "line")?.cgColor
        discountButton.setTitleColor(.black, for: .normal)
        discountButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
   
        let rightArrowImageView = UIImageView(image: UIImage(systemName: "chevron.right"))
        rightArrowImageView.tintColor = UIColor(named: "searchbar")
        rightArrowImageView.translatesAutoresizingMaskIntoConstraints = false
        discountButton.addSubview(rightArrowImageView)
        
        let leftImageView = UIImageView(image: UIImage(named: "percent"))
        leftImageView.translatesAutoresizingMaskIntoConstraints = false
        discountButton.addSubview(leftImageView)
        
        discountButton.addTarget(self, action: #selector(discountButtonPressed), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            discountButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            discountButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            discountButton.topAnchor.constraint(equalTo: line.bottomAnchor, constant: 20),
            discountButton.heightAnchor.constraint(equalToConstant: 56),
            
            rightArrowImageView.centerYAnchor.constraint(equalTo: discountButton.centerYAnchor),
            rightArrowImageView.trailingAnchor.constraint(equalTo: discountButton.trailingAnchor, constant: -16), 
            
            leftImageView.centerYAnchor.constraint(equalTo: discountButton.centerYAnchor),
            leftImageView.leadingAnchor.constraint(equalTo: discountButton.leadingAnchor, constant: 16),
            leftImageView.widthAnchor.constraint(equalToConstant: 20),
            leftImageView.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    @objc func discountButtonPressed() {
        print("Discount")
    }
    
    private func configurepaymentLabel() {
        addSubview(paymentLabel)
        
        paymentLabel.text   = "Payment Summary"
        paymentLabel.font   = UIFont.systemFont(ofSize: 16, weight: .medium)
        
        NSLayoutConstraint.activate([
            paymentLabel.topAnchor.constraint(equalTo: discountButton.bottomAnchor, constant: 20),
            paymentLabel.leadingAnchor.constraint(equalTo: discountButton.leadingAnchor)
        ])
    }
    
    
    private func configurePriceLabel() {
        addSubview(stackViewPrice)
        stackViewPrice.addArrangedSubview(priceLabel)
        stackViewPrice.addArrangedSubview(priceNumber)
        
        priceLabel.text   = "Price"
        priceLabel.font   = UIFont.systemFont(ofSize: 14, weight: .light)
        
        
        priceNumber.text = "$ 4.53"
        priceNumber.font   = UIFont.systemFont(ofSize: 14, weight: .medium)
        
        NSLayoutConstraint.activate([
            stackViewPrice.topAnchor.constraint(equalTo: paymentLabel.bottomAnchor, constant: 20),
            stackViewPrice.leadingAnchor.constraint(equalTo: paymentLabel.leadingAnchor),
            stackViewPrice.trailingAnchor.constraint(equalTo: discountButton.trailingAnchor)
        ])
    }
    
    
    private func configureDeliveryLabel() {
        addSubview(stackViewDelivery)
        stackViewDelivery.addArrangedSubview(deliveryLabel)
        stackViewDelivery.addArrangedSubview(stackViewnumbers)
        
        stackViewnumbers.addArrangedSubview(deliveryNumber)
        stackViewnumbers.addArrangedSubview(deliveryNumberMinus)
        
        deliveryLabel.text = "Delivery Fee"
        deliveryLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        
        deliveryNumber.text = "$ 2.0"
        deliveryNumber.font = UIFont.systemFont(ofSize: 14, weight: .light)
        addMiddleLine(to: deliveryNumber)
        
        deliveryNumberMinus.text = "$ 1.0"
        deliveryNumberMinus.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        
        NSLayoutConstraint.activate([
            stackViewDelivery.topAnchor.constraint(equalTo: stackViewPrice.bottomAnchor, constant: 16),
            stackViewDelivery.leadingAnchor.constraint(equalTo: discountButton.leadingAnchor),
            stackViewDelivery.trailingAnchor.constraint(equalTo: discountButton.trailingAnchor)
        ])
    }

    private func addMiddleLine(to label: UILabel) {
        let lineView = UIView()
        lineView.backgroundColor = UIColor.black
        label.addSubview(lineView)

        lineView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lineView.centerYAnchor.constraint(equalTo: label.centerYAnchor),
            lineView.leadingAnchor.constraint(equalTo: label.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: label.trailingAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }


    private func configureSpacetor2() {
    addSubview(spacetor2)
    
    spacetor2.backgroundColor    = UIColor(named: "line")
    
    NSLayoutConstraint.activate([
        spacetor2.topAnchor.constraint(equalTo: stackViewDelivery.bottomAnchor, constant: 16),
        spacetor2.leadingAnchor.constraint(equalTo: stackViewDelivery.leadingAnchor),
        spacetor2.trailingAnchor.constraint(equalTo: stackViewDelivery.trailingAnchor),
        spacetor2.heightAnchor.constraint(equalToConstant: 1)
    ])
}
    
    
    private func configureTotalLabel() {
        addSubview(stackViewTotal)
        stackViewTotal.addArrangedSubview(totalLabel)
        stackViewTotal.addArrangedSubview(totalLabelNum)
     
        
        totalLabel.text   = "Total Payment"
        totalLabel.font   = UIFont.systemFont(ofSize: 14, weight: .light)
        
        
        totalLabelNum.text = "$ 5.53"
        totalLabelNum.font   = UIFont.systemFont(ofSize: 14, weight: .medium)
        
        NSLayoutConstraint.activate([
            stackViewTotal.topAnchor.constraint(equalTo: spacetor2.bottomAnchor, constant: 16),
            stackViewTotal.leadingAnchor.constraint(equalTo: spacetor2.leadingAnchor),
            stackViewTotal.trailingAnchor.constraint(equalTo: spacetor2.trailingAnchor)
        ])
    }
}
