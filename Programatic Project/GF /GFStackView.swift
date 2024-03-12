//
//  GFStackView.swift
//  Programatic Project
//
//  Created by mücahit öztürk on 10.03.2024.
//

import UIKit

class GFStackView: UIStackView {

    convenience init(space: CGFloat, distribution: UIStackView.Distribution, axis: NSLayoutConstraint.Axis) {
        self.init()
        self.axis = axis
        self.distribution = distribution
        self.spacing = space
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}

