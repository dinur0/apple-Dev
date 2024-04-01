//
//  File.swift
//  Medicine
//
//  Created by хех on 01.04.2024.
//

import Foundation

struct DoctorStructure: Decodable {
    let record: Record
}
struct Record: Decodable {
    let data: DataClass
}
struct DataClass: Decodable {
    let users: [Doctor]
}
struct Doctor: Decodable, Identifiable {
    var id: String
    var firstName: String
    var patronymic: String
    var lastName: String
    var genderLabel: String
    var avatar: URL
    
    enum CodingKeys: String,CodingKey {
        case id
        case firstName = "first_name"
        case patronymic
        case lastName = "last_name"
        case genderLabel = "gender_label"
        case avatar
    }
}
