
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
    var avatar: URL?
    var price: Int
    var rank: Int
    var category: String
    var specializations: [Specialization]

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case patronymic
        case lastName = "last_name"
        case genderLabel = "gender_label"
        case avatar
        case specializations = "specialization"
        case price = "video_chat_price"
        case rank
        case category = "category_label"
    }
}

struct Specialization: Decodable, Identifiable {
    var id: Int
    var name: String
}
