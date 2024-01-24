//
//  ProfileStructure.swift
//  project1
//
//  Created by хех on 24.01.2024.
//

struct ProfileStructure: Decodable{
    var response: Profile
}

struct Profile: Decodable{
    var id: Int
    var photo: String?
    var firstName: String?
    var lastName: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case photo = "photo_400_orig"
    }
}
