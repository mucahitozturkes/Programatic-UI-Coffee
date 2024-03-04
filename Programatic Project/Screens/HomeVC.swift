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
    return 1
}


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 1
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeCell1.reuseID, for: indexPath)
     
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }

}
