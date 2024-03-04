//
//  HomeCell2.swift
//  Programatic Project
//
//  Created by mücahit öztürk on 3.03.2024.
//

import UIKit

class HomeCell2: UITableViewCell {
    
    static let reuseID = "HomeCell2"
      
    var collectionView: UICollectionView!
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
 
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: bounds, collectionViewLayout: layout)
        addSubview(collectionView)
  
        collectionView.register(HomeCellCV.self, forCellWithReuseIdentifier: HomeCellCV.reuseID)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
