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
        collectionView.register(HomeCell1.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeCell1.reuseID)

  

        view.addSubview(collectionView)
        collectionView.collectionViewLayout = createLayout()
        
    }
    
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnvironment in
            guard let self = self else { return nil }
            
            let section = self.pageData[sectionIndex]
            
            switch section {
           
            case .stories:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(120), heightDimension: .absolute(40)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.interGroupSpacing = 10
                section.contentInsets = .init(top: 16, leading: 0, bottom: 30, trailing: 0)
                section.boundarySupplementaryItems = [supplementaryHeaderItem()]
                return section
            }
        }
    }
    
    
    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(300)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
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
//        case .home(let items):
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell1.reuseID, for: indexPath) as! HomeCell1
//          
 //           return cell
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
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HomeCell1.reuseID, for: indexPath) as! HomeCell1
            
            return header
        default:
            return UICollectionReusableView()
        }
    }
    
}
