//
//  NewsStructure.swift
//  project3 SwiftUI
//
//  Created by хех on 25.01.2024.
//

import Foundation

struct NewsStructure: Decodable{
    var results: [News]
}

struct News: Decodable{
    var date: Double
    var title: String
    
    enum CodingKeys: String, CodingKey {
            case title
            case date = "publication_date"
        }
}
