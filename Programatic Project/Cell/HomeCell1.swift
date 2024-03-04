//
//  HomeCell.swift
//  Programatic Project
//
//  Created by mücahit öztürk on 28.02.2024.
//

import UIKit

class HomeCell1: UITableViewCell {

    static let reuseID = "HomeCell1"
    
    var MainView            = GFView(cornerRadius: 0, borderWidth: 0)
    var blackView           = GFView(cornerRadius: 0, borderWidth: 0)
    var secondaryView       = GFImageView(frame: .zero)
    var profileImageView    = GFImageView(frame: .zero)
    var searchBarTextField  = GFTextField()
    var filterButton        = GFLabelButton(backgroundColor: .brown, title: "")
    var locationLabel       = GFTitleLabel(textAlignment: .left, fontSize: 14, textColor: .white)
    var locationButton      = GFButtonLabel(title: "Bilzen, Tanjungbalai", textColor: .white, fontSize: 14, fontWeight: .medium)
    var promoViewButton     = GFLabelButton(backgroundColor: .systemRed, title: "Promo")
    var titleLabelInfo      = GFTitleLabel(textAlignment: .left, fontSize: 32, textColor: .white)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
    
    
    func set1(responseCell: String) {
      
    }
    
    
    private func configureMainView() {
        addSubview(MainView)
        
       MainView.backgroundColor = .systemBackground
        
        NSLayoutConstraint.activate([
            MainView.topAnchor.constraint(equalTo: topAnchor),
            MainView.centerXAnchor.constraint(equalTo: centerXAnchor),
            MainView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            MainView.widthAnchor.constraint(equalToConstant: 315),
            MainView.heightAnchor.constraint(equalToConstant: 350)
         
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

        let placeholderLabel = UILabel()
        placeholderLabel.text = "Search coffee"
        placeholderLabel.textColor = .white
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        searchBarTextField.addSubview(placeholderLabel)

        if let originalImage = UIImage(named: "filter") {
            let scaledImage = originalImage.resizableImage(withCapInsets: .zero, resizingMode: .stretch)
            let scaledSize = CGSize(width: originalImage.size.width * 0.5, height: originalImage.size.height * 0.5)

            UIGraphicsBeginImageContextWithOptions(scaledSize, false, 0.0)
            scaledImage.draw(in: CGRect(origin: .zero, size: scaledSize))
            let newImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()

            filterButton.setImage(newImage, for: .normal)
        }

        let searchImageView = UIImageView(image: UIImage(systemName: "magnifyingglass")?.withRenderingMode(.alwaysTemplate))
        searchImageView.tintColor = .white
        searchBarTextField.addSubview(searchImageView)

        searchImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            searchBarTextField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -160),
            searchBarTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            searchBarTextField.heightAnchor.constraint(equalToConstant: 52),
            searchBarTextField.widthAnchor.constraint(equalToConstant: 315),

            filterButton.trailingAnchor.constraint(equalTo: searchBarTextField.trailingAnchor, constant: -2),
            filterButton.topAnchor.constraint(equalTo: searchBarTextField.topAnchor, constant: 2),
            filterButton.bottomAnchor.constraint(equalTo: searchBarTextField.bottomAnchor, constant: -2),
            filterButton.widthAnchor.constraint(equalToConstant: 45),

            searchImageView.centerYAnchor.constraint(equalTo: searchBarTextField.centerYAnchor),
            searchImageView.leadingAnchor.constraint(equalTo: searchBarTextField.leadingAnchor, constant: 16),

            placeholderLabel.centerYAnchor.constraint(equalTo: searchBarTextField.centerYAnchor),
            placeholderLabel.leadingAnchor.constraint(equalTo: searchImageView.trailingAnchor, constant: 8)
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

        // Add down arrow image view
        let downArrowImageView = UIImageView(image: UIImage(systemName: "chevron.down"))
        downArrowImageView.tintColor = .white
        downArrowImageView.contentMode = .scaleAspectFit
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
