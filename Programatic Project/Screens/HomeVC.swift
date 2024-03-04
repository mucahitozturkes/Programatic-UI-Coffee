//
//  HomeVC.swift
//  Programatic Project
//
//  Created by mücahit öztürk on 28.02.2024.
//

import UIKit

class HomeVC: UIViewController {
    
    var viewHome    = GFView()
    var tableView   = UITableView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureViewHome()
        configureView()
       
    }
    
    
    func configureTableView() {
        viewHome.addSubview(tableView)
        tableView.delegate                     = self
        tableView.dataSource                   = self
        tableView.separatorStyle               = .none
        tableView.showsVerticalScrollIndicator = false
      
        tableView.register(HomeCell1.self, forCellReuseIdentifier: HomeCell1.reuseID)
        tableView.register(HomeCell2.self, forCellReuseIdentifier: HomeCell2.reuseID)
        tableView.register(HomeCell3.self, forCellReuseIdentifier: HomeCell3.reuseID)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
            NSLayoutConstraint.activate([
                tableView.topAnchor.constraint(equalTo: viewHome.topAnchor),
                tableView.leadingAnchor.constraint(equalTo: viewHome.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: viewHome.trailingAnchor),
                tableView.bottomAnchor.constraint(equalTo: viewHome.bottomAnchor)
            ])
    }
    
    
    func configureView() {
        view.backgroundColor = .systemBackground
    }
    
  
    func configureViewHome() {
        view.addSubview(viewHome)

        NSLayoutConstraint.activate([
            viewHome.topAnchor.constraint(equalTo: self.view.topAnchor),
            viewHome.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewHome.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewHome.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -85)
        ])
    }
}


extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 1
        }
        return 0
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeCell1.reuseID, for: indexPath) as! HomeCell1
     
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeCell2.reuseID, for: indexPath) as! HomeCell2
       
            return cell
        }
        return UITableViewCell()
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 300
        } else if indexPath.section == 1 {
            return 50
        }
        return UITableView.automaticDimension
    }
}


extension HomeCellCV: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCellCV.reuseID, for: indexPath) as! HomeCellCV
        
        return cell
    }
    
    
}
