//
//  MockData.swift
//  Programatic Project
//
//  Created by mücahit öztürk on 6.03.2024.
//

import Foundation

struct ListItem {
    let title: String
    
}
struct productList {
    let title: String
    let image: String
    let price: Float
    let vote: Float
    let secondaryTitle: String
}


enum ListSection {
    case headers([ListItem])
    case stories([ListItem])
    case product([productList])
   
    
    var items: [Any] {
        switch self {
            case
                .stories(let items),
                .headers(let items):
            return items
        case
                .product(let items):
            return items
        }
    }
    
    var count: Int { return items.count }
}


struct MockData {
    
    static let shared = MockData()
    
    var pageData: [ListSection] { [headers, stories, product] }
    
    
    private let headers: ListSection = { .headers([.init(title: "")])}()
       
        
    private let stories: ListSection = { .stories([
            .init(title: "Cappuccino"),
            .init(title: "test"),
            .init(title: "test"),
            .init(title: "test"),
            .init(title: "test"),
            .init(title: "test"),
            .init(title: "test"),
            .init(title: "test"),
            .init(title: "test"),
            .init(title: "test"),
            .init(title: "test")
        ])}()
    
    private let product: ListSection = { .product([
        .init(title: "Cappucino", image: "coffe1", price: 4.23, vote: 4.8, secondaryTitle: "with chocolate"),
        .init(title: "Cappucino", image: "coffe2", price: 3.90, vote: 4.5, secondaryTitle: "with Oat Milk"),
        .init(title: "Cappucino", image: "coffe3", price: 6.27, vote: 4.9, secondaryTitle: "with sugar"),
        .init(title: "Cappucino", image: "coffe4", price: 9.22, vote: 4.7, secondaryTitle: "with dark sugar"),
        .init(title: "Cappucino", image: "coffe1", price: 4.23, vote: 4.8, secondaryTitle: "with chocolate"),
        .init(title: "Cappucino", image: "coffe2", price: 3.90, vote: 4.5, secondaryTitle: "with Oat Milk"),
        .init(title: "Cappucino", image: "coffe3", price: 6.27, vote: 4.9, secondaryTitle: "with sugar"),
        .init(title: "Cappucino", image: "coffe4", price: 9.22, vote: 4.7, secondaryTitle: "with dark sugar"),
        .init(title: "Cappucino", image: "coffe1", price: 4.23, vote: 4.8, secondaryTitle: "with chocolate"),
        .init(title: "Cappucino", image: "coffe2", price: 3.90, vote: 4.5, secondaryTitle: "with Oat Milk"),
        .init(title: "Cappucino", image: "coffe3", price: 6.27, vote: 4.9, secondaryTitle: "with sugar"),
        .init(title: "Cappucino", image: "coffe4", price: 9.22, vote: 4.7, secondaryTitle: "with dark sugar"),
 
    ])}()
}
