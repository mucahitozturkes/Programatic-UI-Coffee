//
//  DetailVC.swift
//  Programatic Project
//
//  Created by mücahit öztürk on 8.03.2024.
//

import UIKit

class DetailVC: UIViewController {

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
    let iconView            = GFView(cornerRadius: 12, borderWidth: 0)
    let iconView2           = GFView(cornerRadius: 12, borderWidth: 0)
    let priceText           = GFTitleLabel(textAlignment: .left, fontSize: 14, textColor: .lightGray)
    let priceInt            = GFTitleLabel(textAlignment: .left, fontSize: 21, textColor: UIColor(named: "buttoncolor") ?? .brown)
    let buyButton           = GFLabelButton(backgroundColor: UIColor(named: "buttoncolor") ?? .brown, title: "Buy Now", cornerR: 12)
    let spacetor            = GFImageView(frame: .zero)
    let stackViewSML        = GFStackView(space: 12, distribution: .fillEqually, axis: .horizontal)
    let bottomView          = GFView(cornerRadius: 24, borderWidth: 0)
    let stackViewPrice      = GFStackView(space: 3, distribution: .fillEqually, axis: .vertical)
    var product: productList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    
    func configureBackButton() {
        view.addSubview(backButton)
        
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.tintColor        = .black
        
        backButton.layer.shadowColor = UIColor.lightGray.cgColor
        backButton.layer.shadowOpacity = 0.1
        backButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        backButton.layer.shadowRadius = 3
        backButton.layer.masksToBounds = false
        
        backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            backButton.heightAnchor.constraint(equalToConstant: 32),
            backButton.widthAnchor.constraint(equalToConstant: 32)
        ])
    }
    
    @objc func backButtonPressed() {
        // Dismiss the current view controller
        self.dismiss(animated: true, completion: nil)
    }
    
    func configureTitle() {
        view.addSubview(titleLabel)
      
        titleLabel.text         = product?.title
        titleLabel.font         = UIFont.systemFont(ofSize: 18, weight: .medium)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
         
            
            
        ])
    }
    
    
    func configureHeart() {
        view.addSubview(heartButton)
        
        heartButton.setImage(UIImage(named: "heart"), for: .normal)
        
        NSLayoutConstraint.activate([
            heartButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            heartButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            heartButton.heightAnchor.constraint(equalToConstant: 24),
            heartButton.widthAnchor.constraint(equalToConstant: 24)
            
        ])
    }
    
    
    func configureImageView() {
        view.addSubview(imageView)

        if let imageName = product?.image {
            // Load the image using UIImage(named:) if it's in your app's bundle
            if let image = UIImage(named: imageName) {
                imageView.image = image
            }
        }

        let aspectRatio: CGFloat = 4 / 3

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1/aspectRatio),
            
        ])
    }

    
    func configureBodyTitle() {
        view.addSubview(bodyTitle)
        
        bodyTitle.text      = "Cappucino"
        bodyTitle.font      = UIFont.systemFont(ofSize: 20, weight: .semibold)
        
        NSLayoutConstraint.activate([
            bodyTitle.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            bodyTitle.leadingAnchor.constraint(equalTo: imageView.leadingAnchor)
        ])
    }
    
    
    func configureSecondTitle() {
        view.addSubview(secontTitle)
        
        secontTitle.text        = product?.secondaryTitle
        secontTitle.font        = UIFont.systemFont(ofSize: 12, weight: .light)
        
        NSLayoutConstraint.activate([
            secontTitle.topAnchor.constraint(equalTo: bodyTitle.bottomAnchor, constant: 8),
            secontTitle.leadingAnchor.constraint(equalTo: bodyTitle.leadingAnchor)
        ])
    }
    
    
    func configureStarImage() {
        view.addSubview(starImageView)
        
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
        view.addSubview(votes)
        
        
           if let vote = product?.vote {
               votes.text = "\(vote)"
           }
        
        NSLayoutConstraint.activate([
            votes.topAnchor.constraint(equalTo: secontTitle.bottomAnchor, constant: 16),
            votes.leadingAnchor.constraint(equalTo: starImageView.trailingAnchor, constant: 3)
        ])
    }
    
    
    func configureVotesNumber() {
        view.addSubview(votesNumbers)
        
        votesNumbers.text       = "(230)"
        votesNumbers.font       = UIFont.systemFont(ofSize: 12, weight: .light)
        
        NSLayoutConstraint.activate([
            votesNumbers.topAnchor.constraint(equalTo: secontTitle.bottomAnchor, constant: 20),
            votesNumbers.leadingAnchor.constraint(equalTo: votes.trailingAnchor, constant: 3)
        ])
    }
    
    
    func configureIcons() {
        view.addSubview(iconView)
        iconView.addSubview(icons)
        
        icons.image                     = UIImage(named: "icon1")
        icons.layer.cornerRadius        = 0
            
            
        iconView.backgroundColor      = UIColor(named: "secondTitle")
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
        view.addSubview(iconView2)
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
        view.addSubview(spacetor)
        
        spacetor.backgroundColor    = UIColor(named: "line")
        
        NSLayoutConstraint.activate([
            spacetor.topAnchor.constraint(equalTo: icons.bottomAnchor, constant: 30),
            spacetor.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: -15),
            spacetor.trailingAnchor.constraint(equalTo: icons.trailingAnchor, constant: 20),
            spacetor.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    
    func configuredescriptionTitle() {
        view.addSubview(descriptionTitle)
        
        descriptionTitle.text       = "Description"
        descriptionTitle.font       = UIFont.systemFont(ofSize: 18, weight: .medium)
        
        NSLayoutConstraint.activate([
            descriptionTitle.topAnchor.constraint(equalTo: spacetor.bottomAnchor, constant: 20),
            descriptionTitle.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
        ])
    }
    
    
    func configureTextBox() {
        view.addSubview(textBox)

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
        view.addSubview(sizeText)
        
        sizeText.text       = "Size"
        sizeText.font        = UIFont.systemFont(ofSize: 18, weight: .medium)
        
        NSLayoutConstraint.activate([
            sizeText.topAnchor.constraint(equalTo: textBox.bottomAnchor),
            sizeText.leadingAnchor.constraint(equalTo: descriptionTitle.leadingAnchor),
            
        ])
    }
    
    
    func configureSML() {
        view.addSubview(stackViewSML)
        
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
            
            // Add target action for button tap
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        }
        
        NSLayoutConstraint.activate([
            stackViewSML.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            stackViewSML.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            stackViewSML.topAnchor.constraint(equalTo: sizeText.bottomAnchor, constant: 8),

            smallButton.heightAnchor.constraint(equalToConstant: 43),
            mediumButton.heightAnchor.constraint(equalToConstant: 43),
            largeButton.heightAnchor.constraint(equalToConstant: 43),
        ])
    }

    @objc func buttonTapped(_ sender: UIButton) {
        // Reset styling for all buttons
        for button in [smallButton, mediumButton, largeButton] {
            button.backgroundColor = .white
            button.setTitleColor(.black, for: .normal)
            button.layer.borderColor = UIColor(named: "stroke")?.cgColor
        }
        
        // Apply selected styling to the tapped button
        sender.backgroundColor = UIColor(named: "buttonAlpha")
        sender.setTitleColor(UIColor(named: "buttoncolor"), for: .normal)
        sender.layer.borderColor = UIColor(named: "buttoncolor")?.cgColor
    }

    
    func configureBottomView() {
        view.addSubview(bottomView)
        bottomView.addSubview(buyButton)
        
        bottomView.layer.backgroundColor      = UIColor.white.cgColor
        
        NSLayoutConstraint.activate([
            bottomView.heightAnchor.constraint(lessThanOrEqualToConstant: 121),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
          
            
            buyButton.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            buyButton.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
            buyButton.heightAnchor.constraint(equalToConstant: 55),
            buyButton.widthAnchor.constraint(equalToConstant: 250)
        ])
    }

    
    func configurePrice() {
        bottomView.addSubview(stackViewPrice)
        stackViewPrice.addArrangedSubview(priceText)
        stackViewPrice.addArrangedSubview(priceInt)
        
        bottomView.layer.shadowColor = UIColor.lightGray.cgColor
        bottomView.layer.shadowOpacity = 0.1
        bottomView.layer.shadowOffset = CGSize(width: 0, height: -2)
        bottomView.layer.shadowRadius = 8
        bottomView.layer.masksToBounds = false
       
        
        priceText.font      = UIFont.systemFont(ofSize: 16, weight: .light)
        priceText.text      = "Price"
        
        priceInt.font       = UIFont.systemFont(ofSize: 21, weight: .medium)
        priceInt.text       = "$ \(product?.price ?? 0)"
        
        
        NSLayoutConstraint.activate([
            stackViewPrice.leadingAnchor.constraint(equalTo: sizeText.leadingAnchor),
            stackViewPrice.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor)
        ])
    }
}
