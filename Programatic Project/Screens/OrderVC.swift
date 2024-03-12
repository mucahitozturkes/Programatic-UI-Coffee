//
//  OrderVC.swift
//  Programatic Project
//
//  Created by mücahit öztürk on 11.03.2024.
//

import UIKit


class OrderVC: UIViewController {
    
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureTableView()
    }
    
    
    func configureTableView() {
        tableView.backgroundColor   = .systemBackground
        tableView.delegate          = self
        tableView.dataSource        = self
        
        tableView.register(PickupCell.self, forCellReuseIdentifier: PickupCell.reuseID)
        tableView.register(OrderCell.self, forCellReuseIdentifier: OrderCell.reuseID)
        tableView.register(PaymentCell.self, forCellReuseIdentifier: PaymentCell.reuseID)
        tableView.register(FooterCell.self, forCellReuseIdentifier: FooterCell.reuseID)
       
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)  // Align bottom with the bottom of the superview
        ])
    }

    
    
    func configureView() {
        view.backgroundColor = UIColor(named: "background")
    }

}

extension OrderVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: PickupCell.reuseID, for: indexPath) as! PickupCell
            cell.selectionStyle = .none
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: OrderCell.reuseID, for: indexPath) as! OrderCell
            cell.selectionStyle = .none
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: PaymentCell.reuseID, for: indexPath) as! PaymentCell
            cell.selectionStyle = .none
            return cell
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: FooterCell.reuseID, for: indexPath) as! FooterCell
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 290
        } else if indexPath.row == 1 {
            return 54
        } else if indexPath.row == 2 {
            return 0
        } else if indexPath.row == 3 {
            return 425
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let spacingView = UIView()
        spacingView.backgroundColor = .clear
        return spacingView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       
           return 0
       }
}



