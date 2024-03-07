//
//  MockData.swift
//  Programatic Project
//
//  Created by mücahit öztürk on 6.03.2024.
//

import Foundation

struct ListItem {
    let title: String
    let image: String
    
}


enum ListSection {
    case stories([ListItem])
    
    var items: [ListItem] {
        switch self {
            case
                .stories(let items):
            return items
        }
    }
    
    var count: Int { return items.count }
}


struct MockData {
    
    static let shared = MockData()
    
    var pageData: [ListSection] { [stories] }
    
    private let stories: ListSection = {
        .stories([
            .init(title: "Cappuccino", image: ""),
            .init(title: "test", image: ""),
            .init(title: "test", image: ""),
            .init(title: "test", image: ""),
            .init(title: "test", image: ""),
            .init(title: "test", image: ""),
            .init(title: "test", image: ""),
            .init(title: "test", image: ""),
            .init(title: "test", image: ""),
            .init(title: "test", image: ""),
            .init(title: "test", image: ""),
        ])
        
    }()
}
