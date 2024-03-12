//
//  GFSegmentControl.swift
//  Programatic Project
//
//  Created by mücahit öztürk on 11.03.2024.
//
import UIKit

protocol CustomSegmentedControlDelegate: AnyObject {
    func didSelectSegment(_ segment: Int)
}

class CustomSegmentedControl: UIView {

    weak var delegate: CustomSegmentedControlDelegate?

    private let button1: UIButton = {
        let button = UIButton()
        button.tag = 0
        button.setTitle("Deliver", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.black, for: .selected)
      
        return button
    }()

    private let button2: UIButton = {
        let button = UIButton()
        button.tag = 1
        button.setTitle("Pick Up", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.black, for: .selected)
       
        return button
    }()

    private var indicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "buttoncolor")
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    private func setupUI() {
      
        addSubview(button1)
        addSubview(button2)
        addSubview(indicatorView)

        layer.cornerRadius = 12
        button1.layer.cornerRadius = 12
        button2.layer.cornerRadius = 12
        button1.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false
        indicatorView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            button1.leadingAnchor.constraint(equalTo: leadingAnchor),
            button1.topAnchor.constraint(equalTo: topAnchor),
            button1.bottomAnchor.constraint(equalTo: bottomAnchor),
            button1.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),

            button2.leadingAnchor.constraint(equalTo: button1.trailingAnchor),
            button2.topAnchor.constraint(equalTo: topAnchor),
            button2.bottomAnchor.constraint(equalTo: bottomAnchor),
            button2.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),

            indicatorView.heightAnchor.constraint(equalToConstant: 4),
            indicatorView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            indicatorView.bottomAnchor.constraint(equalTo: bottomAnchor),
            indicatorView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])

        button1.addTarget(self, action: #selector(segmentTapped(_:)), for: .touchUpInside)
        button2.addTarget(self, action: #selector(segmentTapped(_:)), for: .touchUpInside)

        selectSegment(0)
    }

    @objc private func segmentTapped(_ sender: UIButton) {
        selectSegment(sender.tag)
    }

    private func selectSegment(_ index: Int) {
        let selectedButton: UIButton
        let unselectedButton: UIButton

        if index == 0 {
            selectedButton = button1
            unselectedButton = button2
        } else {
            selectedButton = button2
            unselectedButton = button1
        }

        button1.isSelected = (index == 0)
        button2.isSelected = (index == 1)

        UIView.animate(withDuration: 0.3) {
        
            unselectedButton.backgroundColor = .clear
            self.indicatorView.frame.origin.x = selectedButton.frame.origin.x
        }

        delegate?.didSelectSegment(index)
    }
}
