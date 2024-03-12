//
//  HomeCell.swift
//  Programatic Project
//
//  Created by mücahit öztürk on 28.02.2024.
//

import UIKit

class HomeCell1: UICollectionViewCell {

    static let reuseID = "HomeCell1"
    
    var MainView            = GFView(cornerRadius: 0, borderWidth: 0)
    var blackView           = GFView(cornerRadius: 0, borderWidth: 0)
    var secondaryView       = GFImageView(frame: .zero)
    var profileImageView    = GFImageView(frame: .zero)
    var searchBarTextField  = UISearchTextField()
    var filterButton        = GFLabelButton(backgroundColor: UIColor(named: "buttoncolor")!, title: "", cornerR: 16)
    var locationLabel       = GFTitleLabel(textAlignment: .left, fontSize: 14, textColor: .white)
    var locationButton      = GFButtonLabel(title: "Bilzen, Tanjungbalai", textColor: .white, fontSize: 16, fontWeight: .medium)
    var promoViewButton     = GFLabelButton(backgroundColor: .systemRed, title: "Promo", cornerR: 16)
    var titleLabelInfo      = GFTitleLabel(textAlignment: .left, fontSize: 32, textColor: .white)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureMainView()
        configureBlackView()
        configureProfileView()
        configureSearchBar()
        configuresecondaryView()
        configureLabel()
        configureLocationButton()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func configureMainView() {
        addSubview(MainView)

        MainView.backgroundColor = .systemBackground


        NSLayoutConstraint.activate([
            MainView.topAnchor.constraint(equalTo: topAnchor),
            MainView.centerXAnchor.constraint(equalTo: centerXAnchor),
            MainView.bottomAnchor.constraint(equalTo: bottomAnchor),

            MainView.widthAnchor.constraint(equalToConstant: 315),
            MainView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }

    
    
    private func configureBlackView() {
        addSubview(blackView)
        
        blackView.backgroundColor = .black
        
        
        NSLayoutConstraint.activate([
            blackView.topAnchor.constraint(equalTo: topAnchor),
            blackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            blackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
          
            blackView.heightAnchor.constraint(equalToConstant: 240)
         
        ])
    }
    
    
    private func configuresecondaryView() {
        addSubview(secondaryView)
        secondaryView.addSubview(promoViewButton)
        secondaryView.addSubview(titleLabelInfo)
        
        secondaryView.image = UIImage(named: "secondaryView")
        
        promoViewButton.layer.cornerRadius = 5
        promoViewButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        
        titleLabelInfo.text = "Buy one get\none FREE"
        titleLabelInfo.numberOfLines = 2


       
        
        NSLayoutConstraint.activate([
            secondaryView.bottomAnchor.constraint(equalTo: bottomAnchor),
            secondaryView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            secondaryView.widthAnchor.constraint(equalToConstant: 315),
            secondaryView.heightAnchor.constraint(equalToConstant: 140),
            
            promoViewButton.topAnchor.constraint(equalTo: secondaryView.topAnchor, constant: 13),
            promoViewButton.leadingAnchor.constraint(equalTo: secondaryView.leadingAnchor, constant: 23),
            
            promoViewButton.widthAnchor.constraint(equalToConstant: 60),
            promoViewButton.heightAnchor.constraint(equalToConstant: 26),
            
            titleLabelInfo.leadingAnchor.constraint(equalTo: promoViewButton.leadingAnchor),
            titleLabelInfo.bottomAnchor.constraint(equalTo: secondaryView.bottomAnchor, constant: -6),
            
            titleLabelInfo.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    
    private func configureProfileView() {
        addSubview(profileImageView)
        
        profileImageView.image = UIImage(named: "profileImage")
        
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            profileImageView.trailingAnchor.constraint(equalTo: MainView.trailingAnchor),
            
            profileImageView.widthAnchor.constraint(equalToConstant: 44),
            profileImageView.heightAnchor.constraint(equalToConstant: 44)
         
        ])
    }
    
    
    private func configureSearchBar() {
        addSubview(searchBarTextField)
        searchBarTextField.addSubview(filterButton)
        searchBarTextField.translatesAutoresizingMaskIntoConstraints = false
      
        searchBarTextField.placeholder  = "Search coffee"
        searchBarTextField.textColor    = .white
        searchBarTextField.clearButtonMode = .never
        
        searchBarTextField.attributedPlaceholder = NSAttributedString(
            string: "Search coffee",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )

        if let glassIcon = UIImage(systemName: "magnifyingglass")?.withTintColor(.white, renderingMode: .alwaysOriginal) {
      
            searchBarTextField.leftView = UIImageView(image: glassIcon)
            searchBarTextField.leftViewMode = .always
        }
       
        if let originalImage = UIImage(named: "filter") {
            let scaledImage = originalImage.resized(to: CGSize(width: originalImage.size.width * 0.5, height: originalImage.size.height * 0.5))
            
            var config = UIButton.Configuration.plain()
            config.image = scaledImage
           
            filterButton.configuration = config
        }

        NSLayoutConstraint.activate([
            searchBarTextField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -165),
            searchBarTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            searchBarTextField.heightAnchor.constraint(equalToConstant: 52),
            searchBarTextField.widthAnchor.constraint(equalToConstant: 315),

            filterButton.trailingAnchor.constraint(equalTo: searchBarTextField.trailingAnchor, constant: -2),
            filterButton.topAnchor.constraint(equalTo: searchBarTextField.topAnchor, constant: 2),
            filterButton.bottomAnchor.constraint(equalTo: searchBarTextField.bottomAnchor, constant: -2),
            filterButton.widthAnchor.constraint(equalToConstant: 45),

        ])
    }



    private func configureLabel() {
        addSubview(locationLabel)
        
        locationLabel.text = "Location"
        locationLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)

        
        NSLayoutConstraint.activate([
            locationLabel.leadingAnchor.constraint(equalTo: searchBarTextField.leadingAnchor),
            locationLabel.topAnchor.constraint(equalTo: topAnchor, constant: 19),
            
            
        ])
    }
      
    
    private func configureLocationButton() {
        addSubview(locationButton)

        let downArrowImageView = UIImageView(image: UIImage(systemName: "chevron.down"))
        downArrowImageView.tintColor        = .white
        downArrowImageView.contentMode      = .scaleAspectFit
        downArrowImageView.translatesAutoresizingMaskIntoConstraints = false
        locationButton.addSubview(downArrowImageView)

        NSLayoutConstraint.activate([
            locationButton.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: -2),
            locationButton.leadingAnchor.constraint(equalTo: locationLabel.leadingAnchor),
            
            downArrowImageView.leadingAnchor.constraint(equalTo: locationButton.titleLabel!.trailingAnchor, constant: 4),
            downArrowImageView.centerYAnchor.constraint(equalTo: locationButton.titleLabel!.centerYAnchor)
        ])
    }
}

