//
//  GFScrollView.swift
//  Programatic Project
//
//  Created by mücahit öztürk on 12.03.2024.
//

import UIKit

class GFScrollView: UIScrollView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground
    }

}
