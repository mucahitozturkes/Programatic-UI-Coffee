//
//  PickupCell.swift
//  Programatic Project
//
//  Created by mücahit öztürk on 12.03.2024.
//

import UIKit

class DeliveryCell: UITableViewCell {

    static let reuseID = "DeliveryCell"
    
    let backButton          = GFLabelButton(backgroundColor: .white, title: "", cornerR: 5)
    let titleLabel          = GFTitleLabel(textAlignment: .center, fontSize: 18, textColor: .black)
    let bodyTitle           = GFTitleLabel(textAlignment: .left, fontSize: 16, textColor: .black)
    let secondTitle         = GFTitleLabel(textAlignment: .left, fontSize: 14, textColor: .black)
    let thirdTitle          = GFTitleLabel(textAlignment: .left, fontSize: 12, textColor: .darkGray)
    let editButton          = ScaledAspectFitButton(backgroundColor: .white, title: "Edit Address", cornerR: 13)
    let addButton           = ScaledAspectFitButton(backgroundColor: .white, title: "Add Note", cornerR: 13)
    
    let spacetor            = GFImageView(frame: .zero)
    
    var customSegmentedControl: CustomSegmentedControl!
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureBackButton()
        configureTitle()
        configureSegment()
        configureBodyTitle()
        configureSecondTitle()
        configureThirdTitle()
        configureEditButton()
        configureAddButton()
        configureSpacetor()
        contentView.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

     
    }
    
    
    func configureBackButton() {
        addSubview(backButton)
        
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.tintColor        = .black
        
        backButton.layer.shadowColor = UIColor.lightGray.cgColor
        backButton.layer.shadowOpacity = 0.1
        backButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        backButton.layer.shadowRadius = 3
        backButton.layer.masksToBounds = false
        
        backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            backButton.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            backButton.heightAnchor.constraint(equalToConstant: 32),
            backButton.widthAnchor.constraint(equalToConstant: 32)
        ])
    }
    @objc func backButtonPressed() {
       print("done")
    }

    
    func configureTitle() {
        addSubview(titleLabel)
      
        titleLabel.text         = "Order"
        titleLabel.font         = UIFont.systemFont(ofSize: 18, weight: .medium)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    
    func configureBodyTitle() {
        addSubview(bodyTitle)
        
        bodyTitle.text      = "Delivery Adress"
        bodyTitle.font      = UIFont.systemFont(ofSize: 17, weight: .medium)
        
        NSLayoutConstraint.activate([
            bodyTitle.topAnchor.constraint(equalTo: customSegmentedControl.bottomAnchor, constant: 24),
            bodyTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
          
            
        ])
    }
    
    
    func configureSecondTitle() {
        addSubview(secondTitle)
        
        secondTitle.text      = "JI. Kpg Sutoyo"
        secondTitle.font      = UIFont.systemFont(ofSize: 15, weight: .regular)
        
        NSLayoutConstraint.activate([
            secondTitle.topAnchor.constraint(equalTo: bodyTitle.bottomAnchor, constant: 16),
            secondTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
         
            
        ])
    }
    
    
    func configureThirdTitle() {
        addSubview(thirdTitle)
        
        thirdTitle.text      = "Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai."
        thirdTitle.font      = UIFont.systemFont(ofSize: 13, weight: .light)
        
        NSLayoutConstraint.activate([
            thirdTitle.topAnchor.constraint(equalTo: secondTitle.bottomAnchor, constant: 16),
            thirdTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
         
            
        ])
    }
    
    
    func configureEditButton() {
        addSubview(editButton)
        
        editButton.setTitleColor(.black, for: .normal)
        editButton.layer.borderWidth = 1
        editButton.layer.borderColor = UIColor(named: "stroke")?.cgColor
        editButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        editButton.setImage(UIImage(named: "edit"), for: .normal)
   
       
        
        NSLayoutConstraint.activate([
            editButton.topAnchor.constraint(equalTo: thirdTitle.bottomAnchor, constant: 16),
            editButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            editButton.widthAnchor.constraint(equalToConstant: 120),
            editButton.heightAnchor.constraint(equalToConstant: 27)
        ])
    }

    
    func configureAddButton() {
        addSubview(addButton)
        
        addButton.setTitleColor(.black, for: .normal)
        addButton.layer.borderWidth = 1
        addButton.layer.borderColor = UIColor(named: "stroke")?.cgColor
        addButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        addButton.setImage(UIImage(named: "addb"), for: .normal)
     
      
        
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: thirdTitle.bottomAnchor, constant: 16),
            addButton.leadingAnchor.constraint(equalTo: editButton.trailingAnchor, constant: 8),
            addButton.widthAnchor.constraint(equalToConstant: 101),
            addButton.heightAnchor.constraint(equalToConstant: 27)
        ])
    }
    
    
    func configureSpacetor() {
        addSubview(spacetor)
        
        spacetor.backgroundColor    = UIColor(named: "line")
        
        NSLayoutConstraint.activate([
            spacetor.topAnchor.constraint(equalTo: editButton.bottomAnchor, constant: 20),
            spacetor.leadingAnchor.constraint(equalTo: editButton.leadingAnchor),
            spacetor.trailingAnchor.constraint(equalTo: customSegmentedControl.trailingAnchor),
            spacetor.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}

extension DeliveryCell: CustomSegmentedControlDelegate {
    
    func configureSegment() {
        customSegmentedControl = CustomSegmentedControl()
        customSegmentedControl.delegate = self
        
        addSubview(customSegmentedControl)
        
        customSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            customSegmentedControl.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25),
            customSegmentedControl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            customSegmentedControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            customSegmentedControl.heightAnchor.constraint(equalToConstant: 48),
            customSegmentedControl.widthAnchor.constraint(greaterThanOrEqualToConstant: 315),
           
        ])
    }
    
    
    func didSelectSegment(_ segment: Int) {
           print("Selected segment: \(segment)")
       }
}
