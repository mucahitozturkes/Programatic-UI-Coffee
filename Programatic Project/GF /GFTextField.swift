//
//  GFTextField.swift
//  Programatic Project
//
//  Created by mücahit öztürk on 3.03.2024.
//

import UIKit

class GFTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    convenience init(alpha: CGFloat) {
        self.init(frame: .zero)
        self.alpha       = alpha
    }
    
    
    private func configure() {
        layer.cornerRadius = 17
        backgroundColor = .darkGray
        translatesAutoresizingMaskIntoConstraints = false

        // Set attributedPlaceholder separately
        let placeholderAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.white]
        attributedPlaceholder = NSAttributedString(string: "Search coffee", attributes: placeholderAttributes)

        // Create the search icon
        let searchImageView = UIImageView(image: UIImage(systemName: "magnifyingglass")?.withRenderingMode(.alwaysTemplate))
        searchImageView.tintColor = .white

        // Add left padding to the magnifying glass icon
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: -16, height: frame.size.height))
        leftView = leftPaddingView
        leftViewMode = .always

        // Set the UIImageView as the subview of the left padding
        leftPaddingView.addSubview(searchImageView)
        searchImageView.translatesAutoresizingMaskIntoConstraints = false

        // Add -8 leading constraint to the search icon for left padding
        NSLayoutConstraint.activate([
            searchImageView.leadingAnchor.constraint(equalTo: leftPaddingView.leadingAnchor, constant: -8),
            searchImageView.centerYAnchor.constraint(equalTo: leftPaddingView.centerYAnchor)
        ])
    }



}
