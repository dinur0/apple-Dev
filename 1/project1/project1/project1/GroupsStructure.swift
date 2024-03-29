//
//  GroupsStructure.swift
//  project1
//
//  Created by хех on 20.01.2024.
//

struct GroupsStructure: Decodable {
    var response: Groups
}
struct Groups: Decodable {
    var items: [Group]
}
struct Group: Decodable {
    var id: Int
    var name: String?
    var descr: String?
    var photo50: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case descr = "description"
        case photo50 = "photo_50"
    }
}
