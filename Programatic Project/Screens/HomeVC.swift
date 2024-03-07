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
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.322)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .none
                section.interGroupSpacing = 10
              
                return section
            case .stories:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(120), heightDimension: .absolute(40)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.interGroupSpacing = 10
                section.contentInsets = .init(top: 16, leading: 24, bottom: 30, trailing: 0)
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
        case .headers(let items):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell1.reuseID, for: indexPath) as! HomeCell1
           
            return cell
        case .stories(let items):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell2.reuseID, for: indexPath) as! HomeCell2
            cell.setup(items[indexPath.row])
            return cell
//        case .sellers(let items):
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell3.reuseID, for: indexPath) as! HomeCell3
//           
//            return cell
        }
    }
    
 
}
