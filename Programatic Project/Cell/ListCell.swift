//
//  OrderCell.swift
//  Programatic Project
//
//  Created by mücahit öztürk on 11.03.2024.
//

import UIKit



class ListCell: UITableViewCell {

    static let reuseID = "ListCell"

    let imageShow   = GFImageView(frame: .zero)
    let titleLabel  = GFTitleLabel(textAlignment: .left, fontSize: 16, textColor: .black)
    let secondTitle = GFTitleLabel(textAlignment: .left, fontSize: 12, textColor: .lightGray)
    let plusButton  = GFLabelButton(backgroundColor: .white, title: "", cornerR: 16)
    let numberLabel = GFTitleLabel(textAlignment: .center, fontSize: 16, textColor: .black)
    let minusButton = GFLabelButton(backgroundColor: .white, title: "", cornerR: 16)
    let stackView   = GFStackView(space: 3, distribution: .fillEqually, axis: .horizontal)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureImage()
        configureTitleLabel()
        configureSecondTitle()
        configureButtons()
        contentView.isHidden = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    private func configureImage() {
        addSubview(imageShow)

        imageShow.image = UIImage(named: "coffe1")
        imageShow.layer.cornerRadius = 5
        imageShow.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageShow.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            imageShow.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageShow.heightAnchor.constraint(equalToConstant: 54),
            imageShow.widthAnchor.constraint(equalToConstant: 54)
        ])
    }

    private func configureTitleLabel() {
        addSubview(titleLabel)

        titleLabel.text = "Cappucino"
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: imageShow.trailingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 7.5),
        ])
    }

    private func configureSecondTitle() {
        addSubview(secondTitle)

        secondTitle.text    = "with Chocolate"
        secondTitle.font    =  UIFont.systemFont(ofSize: 12, weight: .light)
      

        NSLayoutConstraint.activate([
            secondTitle.leadingAnchor.constraint(equalTo: imageShow.trailingAnchor, constant: 16),
            secondTitle.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
        ])
    }

    private func configureButtons() {
        addSubview(stackView)
        stackView.addArrangedSubview(minusButton)
        stackView.addArrangedSubview(numberLabel)
        stackView.addArrangedSubview(plusButton)

        numberLabel.text = "1"
        numberLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)

        plusButton.layer.borderWidth = 1
        plusButton.layer.borderColor = UIColor(named: "line")?.cgColor
        plusButton.setImage(UIImage(systemName: "plus")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 12)), for: .normal)
        plusButton.tintColor = UIColor.black
        plusButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)

        minusButton.setImage(UIImage(systemName: "minus")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 12)), for: .normal)
        minusButton.layer.borderWidth = 1
        minusButton.layer.borderColor = UIColor(named: "line")?.cgColor
        minusButton.tintColor = UIColor.black
        minusButton.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)

        let scale = CGFloat(30)

        NSLayoutConstraint.activate([
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),

            minusButton.heightAnchor.constraint(equalToConstant: scale),
            minusButton.widthAnchor.constraint(equalToConstant: scale),
            plusButton.widthAnchor.constraint(equalToConstant: scale),
            plusButton.heightAnchor.constraint(equalToConstant: scale),
        ])
    }

    @objc private func plusButtonTapped() {
        guard let currentNumber = Int(numberLabel.text ?? "0") else { return }
        numberLabel.text = "\(currentNumber + 1)"
        print("Plus button tapped")
    }

    @objc private func minusButtonTapped() {
        guard let currentNumber = Int(numberLabel.text ?? "0"), currentNumber > 0 else { return }
        numberLabel.text = "\(currentNumber - 1)"
        print("Minus button tapped")
    }


}

