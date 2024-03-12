//
//  GFView.swift
//  Programatic Project
//
//  Created by mücahit öztürk on 1.03.2024.
//

import UIKit

class GFView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    convenience init(backgroundColor: UIColor,cornerRadius: CGFloat, borderWidth: CGFloat) {
        self.init(frame: .zero)
        self.layer.cornerRadius  = cornerRadius
        self.layer.borderWidth   = borderWidth
        self.backgroundColor     = backgroundColor
    }
    
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds            = true
        
        

      
    }

}
