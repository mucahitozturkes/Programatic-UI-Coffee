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
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureMainView()
        configureBlackView()
        configureProfileView()
        configureSearchBar()
        configureFilterButton()
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
            MainView.topAnchor.constraint(equalTo: self.topAnchor),
            MainView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            MainView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            MainView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
          
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
          
            blackView.heightAnchor.constraint(equalToConstant: 280)
         
        ])
    }
    
    
    private func configuresecondaryView() {
        addSubview(secondaryView)
        
        secondaryView.image = UIImage(named: "secondaryView")
        
        
        NSLayoutConstraint.activate([
            secondaryView.bottomAnchor.constraint(equalTo: bottomAnchor),
            secondaryView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            secondaryView.widthAnchor.constraint(equalToConstant: 315),
            secondaryView.heightAnchor.constraint(equalToConstant: 140)
         
        ])
    }
    
    
    private func configureProfileView() {
        addSubview(profileImageView)
        
        profileImageView.image = UIImage(named: "profileImage")
        
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            profileImageView.trailingAnchor.constraint(equalTo: MainView.trailingAnchor, constant: -30),
            
            profileImageView.widthAnchor.constraint(equalToConstant: 44),
            profileImageView.heightAnchor.constraint(equalToConstant: 44)
         
        ])
    }
    
    
    private func configureSearchBar() {
        addSubview(searchBarTextField)
        
       

        NSLayoutConstraint.activate([
            searchBarTextField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -160),
            searchBarTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
           
            
            searchBarTextField.heightAnchor.constraint(equalToConstant: 52),
            searchBarTextField.widthAnchor.constraint(equalToConstant: 315)
        ])
    }

    
    private func configureFilterButton() {
        addSubview(filterButton)
        
        tintColor = .systemRed
        
        if let originalImage = UIImage(named: "filter") {
            let scaledImage = originalImage.resizableImage(withCapInsets: .zero, resizingMode: .stretch)
            let scaledSize = CGSize(width: originalImage.size.width * 0.5, height: originalImage.size.height * 0.5)
            UIGraphicsBeginImageContextWithOptions(scaledSize, false, 0.0)
            scaledImage.draw(in: CGRect(origin: .zero, size: scaledSize))
            let newImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
      
            filterButton.setImage(newImage, for: .normal)
        }

        NSLayoutConstraint.activate([
            filterButton.trailingAnchor.constraint(equalTo: searchBarTextField.trailingAnchor, constant: -2),
            filterButton.topAnchor.constraint(equalTo: searchBarTextField.topAnchor, constant: 2),
            filterButton.bottomAnchor.constraint(equalTo: searchBarTextField.bottomAnchor, constant: -2),
       
            filterButton.widthAnchor.constraint(equalToConstant: 45)
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
        
        NSLayoutConstraint.activate([
            locationButton.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: -2),
            locationButton.leadingAnchor.constraint(equalTo: locationLabel.leadingAnchor)
        ])
    }
}
