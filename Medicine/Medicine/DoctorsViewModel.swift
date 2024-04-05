
import SwiftUI

class DoctorsViewModel: ObservableObject{
    var doctorsModel: [Doctor] = []
    
    func downloadDoctors(handler:@escaping([Doctor])->()) {
        guard let url = URL(string: "https://api.jsonbin.io/v3/b/655b754e0574da7622c94aa4") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
        guard let data = data else {return}
            do {
                let doctors = try JSONDecoder().decode(DoctorStructure.self, from: data)
                handler(doctors.record.data.users)
            }
        catch {
        }
    }.resume()
    }
    

}
