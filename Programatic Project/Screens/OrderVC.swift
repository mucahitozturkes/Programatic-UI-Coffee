//
//  OrderVC.swift
//  Programatic Project
//
//  Created by mücahit öztürk on 11.03.2024.
//

import UIKit


class OrderVC: UIViewController {
    
    let tableView = UITableView()

    let scrollView          = GFScrollView()
    let backButton          = GFLabelButton(backgroundColor: .white, title: "", cornerR: 5)
    let titleLabel          = GFTitleLabel(textAlignment: .center, fontSize: 18, textColor: .black)
    let bodyTitle           = GFTitleLabel(textAlignment: .left, fontSize: 16, textColor: .black)
    let secondTitle         = GFTitleLabel(textAlignment: .left, fontSize: 14, textColor: .black)
    let thirdTitle          = GFTitleLabel(textAlignment: .left, fontSize: 12, textColor: .darkGray)
    let editButton          = ScaledAspectFitButton(backgroundColor: .white, title: "Edit Address", cornerR: 13)
    let addButton           = ScaledAspectFitButton(backgroundColor: .white, title: "Add Note", cornerR: 13)
    
    let spacetor            = GFImageView(frame: .zero)
   
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
    
    let bottomView          = GFView(cornerRadius: 24, borderWidth: 1)
    
    var customSegmentedControl: CustomSegmentedControl!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        scrollerView()
        configureBackButton()
        configureTitle()
        configureSegment()
        configureBodyTitle()
        configureSecondTitle()
        configureThirdTitle()
        configureEditButton()
        configureAddButton()
        configureSpacetor()
        configureTableView()
        configureLine()
        configureDiscountButton()
        configurepaymentLabel()
        configurePriceLabel()
        configureDeliveryLabel()
        configureSpacetor2()
        configureTotalLabel()
        configureBottomView()
    }
    
    
    func configureTableView() {
        tableView.backgroundColor   = .systemBackground
        tableView.delegate          = self
        tableView.dataSource        = self
        tableView.register(OrderCell.self, forCellReuseIdentifier: OrderCell.reuseID)
       
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        scrollView.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: spacetor.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: customSegmentedControl.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: customSegmentedControl.trailingAnchor),
            tableView.heightAnchor.constraint(greaterThanOrEqualToConstant:  54)
        ])
    }
    
    
    func configureView() {
        view.backgroundColor = UIColor(named: "background")
    }
    
    
    func scrollerView() {
        view.addSubview(scrollView)
        
           NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
           ])
    }
    
    
    func configureBackButton() {
        scrollView.addSubview(backButton)
        
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.tintColor        = .black
        
        backButton.layer.shadowColor = UIColor.lightGray.cgColor
        backButton.layer.shadowOpacity = 0.1
        backButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        backButton.layer.shadowRadius = 3
        backButton.layer.masksToBounds = false
        
        backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 30),
            backButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 30),
            backButton.heightAnchor.constraint(equalToConstant: 32),
            backButton.widthAnchor.constraint(equalToConstant: 32)
        ])
    }
    @objc func backButtonPressed() {
        self.dismiss(animated: true, completion: nil)
    }

    
    func configureTitle() {
        scrollView.addSubview(titleLabel)
      
        titleLabel.text         = "Order"
        titleLabel.font         = UIFont.systemFont(ofSize: 18, weight: .medium)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 30),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    
    func configureBodyTitle() {
        scrollView.addSubview(bodyTitle)
        
        bodyTitle.text      = "Delivery Adress"
        bodyTitle.font      = UIFont.systemFont(ofSize: 17, weight: .medium)
        
        NSLayoutConstraint.activate([
            bodyTitle.topAnchor.constraint(equalTo: customSegmentedControl.bottomAnchor, constant: 24),
            bodyTitle.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 30),
          
            
        ])
    }
    
    
    func configureSecondTitle() {
        scrollView.addSubview(secondTitle)
        
        secondTitle.text      = "JI. Kpg Sutoyo"
        secondTitle.font      = UIFont.systemFont(ofSize: 15, weight: .regular)
        
        NSLayoutConstraint.activate([
            secondTitle.topAnchor.constraint(equalTo: bodyTitle.bottomAnchor, constant: 16),
            secondTitle.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 30),
         
            
        ])
    }
    
    
    func configureThirdTitle() {
        scrollView.addSubview(thirdTitle)
        
        thirdTitle.text      = "Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai."
        thirdTitle.font      = UIFont.systemFont(ofSize: 13, weight: .light)
        
        NSLayoutConstraint.activate([
            thirdTitle.topAnchor.constraint(equalTo: secondTitle.bottomAnchor, constant: 16),
            thirdTitle.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 30),
         
            
        ])
    }
    
    
    func configureEditButton() {
        scrollView.addSubview(editButton)
        
        editButton.setTitleColor(.black, for: .normal)
        editButton.layer.borderWidth = 1
        editButton.layer.borderColor = UIColor(named: "stroke")?.cgColor
        editButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        editButton.setImage(UIImage(named: "edit"), for: .normal)
   
       
        
        NSLayoutConstraint.activate([
            editButton.topAnchor.constraint(equalTo: thirdTitle.bottomAnchor, constant: 16),
            editButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 30),
            editButton.widthAnchor.constraint(equalToConstant: 120),
            editButton.heightAnchor.constraint(equalToConstant: 27)
        ])
    }

    
    func configureAddButton() {
        scrollView.addSubview(addButton)
        
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
        scrollView.addSubview(spacetor)
        
        spacetor.backgroundColor    = UIColor(named: "line")
        
        NSLayoutConstraint.activate([
            spacetor.topAnchor.constraint(equalTo: editButton.bottomAnchor, constant: 20),
            spacetor.leadingAnchor.constraint(equalTo: editButton.leadingAnchor),
            spacetor.trailingAnchor.constraint(equalTo: customSegmentedControl.trailingAnchor),
            spacetor.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    
    func configureLine() {
        scrollView.addSubview(line)
        
        line.backgroundColor = UIColor(named: "space")
        
        NSLayoutConstraint.activate([
            line.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            line.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            line.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 20),
            line.heightAnchor.constraint(equalToConstant: 4)
        ])
    }
    
    
    func configureDiscountButton() {
        scrollView.addSubview(discountButton)
        
        discountButton.layer.borderWidth = 1
        discountButton.layer.borderColor = UIColor(named: "line")?.cgColor
        discountButton.setTitleColor(.black, for: .normal)
        discountButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        
        NSLayoutConstraint.activate([
            discountButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            discountButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            discountButton.topAnchor.constraint(equalTo: line.bottomAnchor, constant: 20),
            discountButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    
    func configurepaymentLabel() {
        scrollView.addSubview(paymentLabel)
        
        paymentLabel.text   = "Payment Summary"
        paymentLabel.font   = UIFont.systemFont(ofSize: 16, weight: .medium)
        
        NSLayoutConstraint.activate([
            paymentLabel.topAnchor.constraint(equalTo: discountButton.bottomAnchor, constant: 20),
            paymentLabel.leadingAnchor.constraint(equalTo: discountButton.leadingAnchor)
        ])
    }
    
    
    func configurePriceLabel() {
        scrollView.addSubview(stackViewPrice)
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
    
    
    func configureDeliveryLabel() {
        scrollView.addSubview(stackViewDelivery)
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

    func addMiddleLine(to label: UILabel) {
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


    func configureSpacetor2() {
        scrollView.addSubview(spacetor2)
        
        spacetor2.backgroundColor    = UIColor(named: "line")
        
        NSLayoutConstraint.activate([
            spacetor2.topAnchor.constraint(equalTo: stackViewDelivery.bottomAnchor, constant: 16),
            spacetor2.leadingAnchor.constraint(equalTo: stackViewDelivery.leadingAnchor),
            spacetor2.trailingAnchor.constraint(equalTo: stackViewDelivery.trailingAnchor),
            spacetor2.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    
    func configureTotalLabel() {
        scrollView.addSubview(stackViewTotal)
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
    
    
    func configureBottomView() {
        scrollView.addSubview(bottomView)
        
        bottomView.backgroundColor = .red
        
        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            bottomView.topAnchor.constraint(equalTo: stackViewTotal.bottomAnchor, constant: 32),
            bottomView.heightAnchor.constraint(equalToConstant: 161)
        ])
    }

}

extension OrderVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: OrderCell.reuseID, for: indexPath) as! OrderCell
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 58
    }
}

extension OrderVC: CustomSegmentedControlDelegate {
    
    func configureSegment() {
        customSegmentedControl = CustomSegmentedControl()
        customSegmentedControl.delegate = self
        
        scrollView.addSubview(customSegmentedControl)
        
        customSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            customSegmentedControl.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25),
            customSegmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            customSegmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            customSegmentedControl.heightAnchor.constraint(equalToConstant: 48),
            customSegmentedControl.widthAnchor.constraint(greaterThanOrEqualToConstant: 315),
           
        ])
    }
    
    
    func didSelectSegment(_ segment: Int) {
           print("Selected segment: \(segment)")
       }
}
