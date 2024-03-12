//
//  DetailVC.swift
//  Programatic Project
//
//  Created by mücahit öztürk on 8.03.2024.
//

import UIKit

class DetailVC: UIViewController {

    let scrollView          = GFScrollView()
    let backButton          = GFLabelButton(backgroundColor: .white, title: "", cornerR: 5)
    let titleLabel          = GFTitleLabel(textAlignment: .center, fontSize: 18, textColor: .black)
    let heartButton         = GFLabelButton(backgroundColor: .white, title: "", cornerR: 5)
    let imageView           = GFImageView(frame: .zero)
    let bodyTitle           = GFTitleLabel(textAlignment: .left, fontSize: 20, textColor: .black)
    let secontTitle         = GFTitleLabel(textAlignment: .left, fontSize: 12, textColor: .darkGray)
    let starImageView       = GFImageView(frame: .zero)
    let votes               = GFTitleLabel(textAlignment: .center, fontSize: 18, textColor: .black)
    let votesNumbers        = GFTitleLabel(textAlignment: .center, fontSize: 14, textColor: .darkGray)
    let icons               = GFImageView(frame: .zero)
    let icons2              = GFImageView(frame: .zero)
    let descriptionTitle    = GFTitleLabel(textAlignment: .left, fontSize: 18, textColor: .black)
    let textBox             = UITextView()
    let sizeText            = GFTitleLabel(textAlignment: .left, fontSize: 16, textColor: .black)
    let smallButton         = GFLabelButton(backgroundColor: .black, title: "S", cornerR: 12)
    let mediumButton        = GFLabelButton(backgroundColor: .black, title: "M", cornerR: 12)
    let largeButton         = GFLabelButton(backgroundColor: .black, title: "L", cornerR: 12)
    let iconView            = GFView(backgroundColor: UIColor(named: "secondTitle") ?? .red, cornerRadius: 12, borderWidth: 0)
    let iconView2           = GFView(backgroundColor: UIColor(named: "secondTitle") ?? .red, cornerRadius: 12, borderWidth: 0)
    let priceText           = GFTitleLabel(textAlignment: .left, fontSize: 14, textColor: .lightGray)
    let priceInt            = GFTitleLabel(textAlignment: .left, fontSize: 21, textColor: UIColor(named: "buttoncolor") ?? .brown)
    let buyButton           = GFLabelButton(backgroundColor: UIColor(named: "buttoncolor") ?? .brown, title: "Buy Now", cornerR: 12)
    let spacetor            = GFImageView(frame: .zero)
    let stackViewSML        = GFStackView(space: 12, distribution: .fillEqually, axis: .horizontal)
    let bottomView          = GFView(backgroundColor: .white, cornerRadius: 24, borderWidth: 1)
    let stackViewPrice      = GFStackView(space: 3, distribution: .fillEqually, axis: .vertical)
    var product: productList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollerView()
        configureView()
        configureBackButton()
        configureTitle()
        configureHeart()
        configureImageView()
        configureBodyTitle()
        configureSecondTitle()
        configureStarImage()
        configureVotes()
        configureVotesNumber()
        configureIcons()
        configureIcons2()
        configureSpacetor()
        configuredescriptionTitle()
        configureTextBox()
        configureSize()
        configureSML()
        configureBottomView()
        configurePrice()
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
      
        titleLabel.text         = "Detail"
        titleLabel.font         = UIFont.systemFont(ofSize: 18, weight: .medium)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 30),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
         
            
            
        ])
    }
    
    
    func configureHeart() {
        scrollView.addSubview(heartButton)
        
        heartButton.setImage(UIImage(named: "heart"), for: .normal)
        
        NSLayoutConstraint.activate([
            heartButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 30),
            heartButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            heartButton.heightAnchor.constraint(equalToConstant: 24),
            heartButton.widthAnchor.constraint(equalToConstant: 24)
            
        ])
    }
    
    
    func configureImageView() {
        scrollView.addSubview(imageView)

        
        imageView.image = UIImage(named: product?.image ?? "")
            
        

        let aspectRatio: CGFloat = 4 / 3

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(lessThanOrEqualTo: titleLabel.bottomAnchor, constant: 25),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1/aspectRatio),
            
        ])
    }

    
    func configureBodyTitle() {
        scrollView.addSubview(bodyTitle)
        
        bodyTitle.text      = product?.title
        bodyTitle.font      = UIFont.systemFont(ofSize: 20, weight: .semibold)
        
        NSLayoutConstraint.activate([
            bodyTitle.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            bodyTitle.leadingAnchor.constraint(equalTo: imageView.leadingAnchor)
        ])
    }
    
    
    func configureSecondTitle() {
        scrollView.addSubview(secontTitle)
        
        secontTitle.text        = product?.secondaryTitle
        secontTitle.font        = UIFont.systemFont(ofSize: 12, weight: .light)
        
        NSLayoutConstraint.activate([
            secontTitle.topAnchor.constraint(equalTo: bodyTitle.bottomAnchor, constant: 8),
            secontTitle.leadingAnchor.constraint(equalTo: bodyTitle.leadingAnchor)
        ])
    }
    
    
    func configureStarImage() {
        scrollView.addSubview(starImageView)
        
        starImageView.image     = UIImage(systemName: "star.fill")
        starImageView.tintColor = UIColor(named: "star")
        
        NSLayoutConstraint.activate([
            starImageView.topAnchor.constraint(equalTo: secontTitle.bottomAnchor, constant: 16),
            starImageView.leadingAnchor.constraint(equalTo: secontTitle.leadingAnchor),
            starImageView.heightAnchor.constraint(equalToConstant: 20),
            starImageView.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    
    func configureVotes() {
        scrollView.addSubview(votes)
        
        
           if let vote = product?.vote {
               votes.text = "\(vote)"
           }
        
        NSLayoutConstraint.activate([
            votes.topAnchor.constraint(equalTo: secontTitle.bottomAnchor, constant: 16),
            votes.leadingAnchor.constraint(equalTo: starImageView.trailingAnchor, constant: 3)
        ])
    }
    
    
    func configureVotesNumber() {
        scrollView.addSubview(votesNumbers)
        
        votesNumbers.text       = "(230)"
        votesNumbers.font       = UIFont.systemFont(ofSize: 12, weight: .light)
        
        NSLayoutConstraint.activate([
            votesNumbers.topAnchor.constraint(equalTo: secontTitle.bottomAnchor, constant: 20),
            votesNumbers.leadingAnchor.constraint(equalTo: votes.trailingAnchor, constant: 3)
        ])
    }
    
    
    func configureIcons() {
        scrollView.addSubview(iconView)
        iconView.addSubview(icons)
        
        icons.image                     = UIImage(named: "icon1")
        icons.layer.cornerRadius        = 0
            
        iconView.layer.cornerRadius   = 12
        
        NSLayoutConstraint.activate([
            iconView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            iconView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 60),
            iconView.heightAnchor.constraint(equalToConstant: 44),
            iconView.widthAnchor.constraint(equalToConstant: 44),
            
            icons.centerXAnchor.constraint(equalTo: iconView.centerXAnchor),
            icons.centerYAnchor.constraint(equalTo: iconView.centerYAnchor),
            
            icons.heightAnchor.constraint(equalToConstant: 22),
            icons.widthAnchor.constraint(equalToConstant: 22)
        ])
    }
    
    
    func configureIcons2() {
        scrollView.addSubview(iconView2)
        iconView2.addSubview(icons2)
        
        icons2.image                     = UIImage(named: "icon2")
        icons2.layer.cornerRadius        = 0
            
            
        iconView2.backgroundColor      = UIColor(named: "secondTitle")
        iconView2.layer.cornerRadius   = 12
        
        NSLayoutConstraint.activate([
            iconView2.trailingAnchor.constraint(equalTo: iconView.leadingAnchor, constant: -12),
            iconView2.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 60),
            iconView2.heightAnchor.constraint(equalToConstant: 44),
            iconView2.widthAnchor.constraint(equalToConstant: 44),
            
            icons2.centerXAnchor.constraint(equalTo: iconView2.centerXAnchor),
            icons2.centerYAnchor.constraint(equalTo: iconView2.centerYAnchor),
            
            icons2.heightAnchor.constraint(equalToConstant: 28),
            icons2.widthAnchor.constraint(equalToConstant: 28)
        ])
    }
    
    
    func configureSpacetor() {
        scrollView.addSubview(spacetor)
        
        spacetor.backgroundColor    = UIColor(named: "line")
        
        NSLayoutConstraint.activate([
            spacetor.topAnchor.constraint(equalTo: icons.bottomAnchor, constant: 30),
            spacetor.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: -15),
            spacetor.trailingAnchor.constraint(equalTo: icons.trailingAnchor, constant: 20),
            spacetor.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    
    func configuredescriptionTitle() {
        scrollView.addSubview(descriptionTitle)
        
        descriptionTitle.text       = "Description"
        descriptionTitle.font       = UIFont.systemFont(ofSize: 18, weight: .medium)
        
        NSLayoutConstraint.activate([
            descriptionTitle.topAnchor.constraint(equalTo: spacetor.bottomAnchor, constant: 20),
            descriptionTitle.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
        ])
    }
    
    
    func configureTextBox() {
        scrollView.addSubview(textBox)

        textBox.text                                        = "A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the"
        textBox.translatesAutoresizingMaskIntoConstraints   = false
        textBox.font                                        = UIFont.systemFont(ofSize: 14, weight: .light)
        textBox.isEditable                                  = false
        textBox.textContainerInset                          = .zero
        textBox.textColor                                   = .lightGray
        textBox.backgroundColor                             = UIColor(named: "background")

        NSLayoutConstraint.activate([
            textBox.topAnchor.constraint(equalTo: descriptionTitle.bottomAnchor, constant: 8),
            textBox.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: -5),
            textBox.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            textBox.heightAnchor.constraint(equalToConstant: 70),
        ])
    }
    
    
    func configureSize() {
        scrollView.addSubview(sizeText)
        
        sizeText.text       = "Size"
        sizeText.font        = UIFont.systemFont(ofSize: 18, weight: .medium)
        
        NSLayoutConstraint.activate([
            sizeText.topAnchor.constraint(equalTo: textBox.bottomAnchor),
            sizeText.leadingAnchor.constraint(equalTo: descriptionTitle.leadingAnchor),
            
        ])
    }
    
    
    func configureSML() {
        scrollView.addSubview(stackViewSML)
        
        stackViewSML.addArrangedSubview(smallButton)
        stackViewSML.addArrangedSubview(mediumButton)
        stackViewSML.addArrangedSubview(largeButton)
        
        let buttons = [smallButton, mediumButton, largeButton]
        
        for button in buttons {
            button.backgroundColor = .white
            button.setTitleColor(.black, for: .normal)
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor(named: "stroke")?.cgColor
            button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .light)
            
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        }
        
        NSLayoutConstraint.activate([
            stackViewSML.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            stackViewSML.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            stackViewSML.topAnchor.constraint(equalTo: sizeText.bottomAnchor, constant: 12),

            smallButton.heightAnchor.constraint(equalToConstant: 43),
            mediumButton.heightAnchor.constraint(equalToConstant: 43),
            largeButton.heightAnchor.constraint(equalToConstant: 43),
        ])
    }
    @objc func buttonTapped(_ sender: UIButton) {
        
        for button in [smallButton, mediumButton, largeButton] {
            button.backgroundColor = .white
            button.setTitleColor(.black, for: .normal)
            button.layer.borderColor = UIColor(named: "stroke")?.cgColor
        }
        
        sender.backgroundColor = UIColor(named: "buttonAlpha")
        sender.setTitleColor(UIColor(named: "buttoncolor"), for: .normal)
        sender.layer.borderColor = UIColor(named: "buttoncolor")?.cgColor
    }

    
    func configureBottomView() {
        scrollView.addSubview(buyButton)
        
        buyButton.addTarget(self, action: #selector(buttonTappedBuy(_:)), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            buyButton.topAnchor.constraint(greaterThanOrEqualTo: stackViewSML.bottomAnchor, constant: 64),
            buyButton.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            buyButton.bottomAnchor.constraint(greaterThanOrEqualTo: scrollView.bottomAnchor, constant: -30),
            buyButton.heightAnchor.constraint(equalToConstant: 62),
            buyButton.widthAnchor.constraint(equalToConstant: 214),
        ])
    }
    @objc func buttonTappedBuy(_ sender: UIButton) {
       let destVC   = OrderVC()
        
        destVC.modalTransitionStyle = .coverVertical
        destVC.modalPresentationStyle = .fullScreen
        present(destVC, animated: true)
    }

    
    func configurePrice() {
        scrollView.addSubview(stackViewPrice)
        stackViewPrice.addArrangedSubview(priceText)
        stackViewPrice.addArrangedSubview(priceInt)
        
        priceText.font      = UIFont.systemFont(ofSize: 16, weight: .light)
        priceText.text      = "Price"
        
        priceInt.font       = UIFont.systemFont(ofSize: 21, weight: .medium)
        priceInt.text       = "$ \(product?.price ?? 0)"
        
        NSLayoutConstraint.activate([
            stackViewPrice.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            stackViewPrice.bottomAnchor.constraint(equalTo: buyButton.bottomAnchor),
            stackViewPrice.topAnchor.constraint(equalTo: buyButton.topAnchor)
        ])
    }
}
