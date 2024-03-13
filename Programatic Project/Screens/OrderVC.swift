//
//  OrderVC.swift
//  Programatic Project
//
//  Created by mücahit öztürk on 11.03.2024.
//

import UIKit

enum CellType {
        case delivery
        case list
        case payment
        case order
    }

class OrderVC: UIViewController {
    
    let tableView = UITableView()
    let cellTypes: [CellType] = [.delivery, .list, .payment, .order]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureTableView()
    }
    
    
    func configureTableView() {
        tableView.backgroundColor   = .systemBackground
        tableView.delegate          = self
        tableView.dataSource        = self
        
        tableView.register(DeliveryCell.self, forCellReuseIdentifier: DeliveryCell.reuseID)
        tableView.register(ListCell.self, forCellReuseIdentifier: ListCell.reuseID)
        tableView.register(PaymentCell.self, forCellReuseIdentifier: PaymentCell.reuseID)
        tableView.register(OrderCell.self, forCellReuseIdentifier: OrderCell.reuseID)
       
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    
    
    func configureView() {
        view.backgroundColor = UIColor(named: "background")
    }

}

extension OrderVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = cellTypes[indexPath.row]
        
        switch cellType {
        case .delivery:
            let cell = tableView.dequeueReusableCell(withIdentifier: DeliveryCell.reuseID, for: indexPath) as! DeliveryCell
            cell.selectionStyle = .none
            //cell.backgroundColor = .red
       
            return cell
        case .list:
            let cell = tableView.dequeueReusableCell(withIdentifier: ListCell.reuseID, for: indexPath) as! ListCell
            cell.selectionStyle = .none
            //cell.backgroundColor = .yellow
            return cell
        case .payment:
            let cell = tableView.dequeueReusableCell(withIdentifier: PaymentCell.reuseID, for: indexPath) as! PaymentCell
            cell.selectionStyle = .none
            //cell.backgroundColor = .green
            return cell
        case .order:
            let cell = tableView.dequeueReusableCell(withIdentifier: OrderCell.reuseID, for: indexPath) as! OrderCell
            cell.selectionStyle = .none
            //cell.backgroundColor = .blue
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellType = cellTypes[indexPath.row]
        
        switch cellType {
        case .delivery:
            return 290
        case .list:
            return 54
        case .payment:
            return 260
        case .order:
            return 181
        }
    }
    
   
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0, 1, 2:
            return 0
        case 3:
            return 30
        default:
            return 0
        }
    }

}



