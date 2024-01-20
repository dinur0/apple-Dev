//
//  PhotoStructure.swift
//  project1
//
//  Created by хех on 20.01.2024.
//
//
//  GroupsStructure.swift
//  project1
//
//  Created by хех on 20.01.2024.
//

struct PhotoStructure: Decodable {
    var response: Photos
}
struct Photos: Decodable {
    var items: [Photo]
}
struct Photo: Decodable {
    var sizes: [Jpg]
}
struct Jpg: Decodable {
    var url: String?
}
