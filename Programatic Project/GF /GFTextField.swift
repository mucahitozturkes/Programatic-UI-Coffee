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
        backgroundColor = UIColor(named: "searchbar")
        translatesAutoresizingMaskIntoConstraints = false

    
    }



}
