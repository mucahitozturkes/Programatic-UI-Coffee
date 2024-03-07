//
//  HomeVC.swift
//  Programatic Project
//
//  Created by mücahit öztürk on 28.02.2024.
//

import UIKit

class HomeVC: UIViewController {
    
    var collectionView:  UICollectionView!

    private let pageData = MockData.shared.pageData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
       title = "Collection View"
        view.backgroundColor = .red
    }
    
    
    func configureCollectionView() {
        let layout = UICollectionViewFlowLayout()
              
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.register(HomeCell1.self, forCellWithReuseIdentifier: HomeCell1.reuseID)
        collectionView.register(HomeCell2.self, forCellWithReuseIdentifier: HomeCell2.reuseID)
        collectionView.register(HomeCell3.self, forCellWithReuseIdentifier: HomeCell3.reuseID)
     
        view.addSubview(collectionView)
        collectionView.collectionViewLayout = createLayout()
        
    }
    
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnvironment in
            guard let self = self else { return nil }
            
            let section = self.pageData[sectionIndex]
            
            switch section {
                
            case .headers:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(300)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .none
                section.interGroupSpacing = 10
              
                return section
                
            case .stories:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(140), heightDimension: .absolute(40)), subitems: [item])

                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.interGroupSpacing = 18
                section.contentInsets = .init(top: 16, leading: 24, bottom: 30, trailing: 0)
                
                return section
            
            case .product(_):
            
                let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(149), heightDimension: .absolute(239))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(239))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item, item])
                group.interItemSpacing = .fixed(16)
                
                let section = NSCollectionLayoutSection(group: group)
                let contentInsets = (collectionView.bounds.width - (2 * 149 + 16)) / 2
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: contentInsets, bottom: 16, trailing: contentInsets)
                section.interGroupSpacing = 12
                
                return section
            }
        }
    }
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return pageData.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pageData[section].count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch pageData[indexPath.section] {
        case .headers(_):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell1.reuseID, for: indexPath) as! HomeCell1
           
            return cell
        case .stories(let items):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell2.reuseID, for: indexPath) as! HomeCell2
            cell.setup(items[indexPath.row])
            return cell
        case .product(let items):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell3.reuseID, for: indexPath) as! HomeCell3
            let listItem = ListItem(title: "Your Title")
            cell.setup(listItem, products: items[indexPath.row])
            return cell

        }
    }
}
