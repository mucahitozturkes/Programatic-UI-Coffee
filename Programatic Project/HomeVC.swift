//
//  HomeVC.swift
//  Programatic Project
//
//  Created by mücahit öztürk on 28.02.2024.
//

import UIKit

class HomeVC: UIViewController {
    
    var tableView = UITableView()
    var test: [List] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        populateTestArray()
    }
    
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.delegate      = self
        tableView.dataSource    = self
        tableView.rowHeight     = 60
        tableView.frame         = view.bounds
      
        tableView.register(HomeCell.self, forCellReuseIdentifier: HomeCell.reuseID)
    }
    
    
    func populateTestArray() {
        test = []
        for _ in 1...20 {
            let example = List(test: "test")
            test.append(example)
        }
    }


}


extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return test.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeCell.reuseID, for: indexPath) as! HomeCell
        let index = test[indexPath.row]
        
        cell.set(list: index)
        
        
        return cell
    }
    
    
}
