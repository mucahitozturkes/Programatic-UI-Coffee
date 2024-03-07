//
//  GFButton.swift
//  Programatic Project
//
//  Created by mücahit öztürk on 1.03.2024.
//

import UIKit

class GFLabelButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(backgroundColor: UIColor, title: String, cornerR: CGFloat) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = cornerR
    }
    
    private func configure() {
        titleLabel?.font           = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
