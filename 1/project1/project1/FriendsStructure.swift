//
//  FriendsStructure.swift
//  project1
//
//  Created by хех on 18.01.2024.
//


struct FriendsStructure: Decodable {
    var response: Friends
}
struct Friends: Decodable {
    var items: [Friend]
}
struct Friend: Decodable {
    var id: Int
    var firstName: String?
    var lastName: String?
    var photo: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case photo = "photo_100"
    }
}
