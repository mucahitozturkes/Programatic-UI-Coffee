//
//  GFButtonLabel.swift
//  Programatic Project
//
//  Created by mücahit öztürk on 4.03.2024.
//

import UIKit

class GFButtonLabel: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(title: String, textColor: UIColor, fontSize: CGFloat, fontWeight: UIFont.Weight) {
        self.init(frame: .zero)
        self.setTitleColor(textColor, for: .normal)
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
    }

    
    private func configure() {
        layer.cornerRadius         = 16
        titleLabel?.font           = UIFont.preferredFont(forTextStyle: .headline)
        setTitleColor(.white, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
