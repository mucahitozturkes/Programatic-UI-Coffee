//
//  HomeCellCV.swift
//  Programatic Project
//
//  Created by mücahit öztürk on 4.03.2024.
//

import UIKit

class HomeCellCV: UICollectionViewCell{

    
    static let reuseID = "HomeCellCV"
    
    var collectionView: UICollectionView!
    var viewHome = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCollectionView()
        configureSection1()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set2(responseCell: String) {
        // Implement your set2 logic here
    }
    
    func configureCollectionView() {
        viewHome.addSubview(collectionView)

        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: viewHome.bounds, collectionViewLayout: layout)
        
        collectionView.register(HomeCell2.self, forCellWithReuseIdentifier: HomeCell2.reuseID)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: viewHome.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: viewHome.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: viewHome.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: viewHome.bottomAnchor)
        ])
    }
    
    private func configureSection1() {
        addSubview(viewHome)
        
        NSLayoutConstraint.activate([
            viewHome.topAnchor.constraint(equalTo: topAnchor),
            viewHome.leadingAnchor.constraint(equalTo: leadingAnchor),
            viewHome.trailingAnchor.constraint(equalTo: trailingAnchor),
            viewHome.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}


