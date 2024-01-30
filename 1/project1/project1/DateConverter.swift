import Foundation

final class DateConverter{
    static func convertData(data: Date?) -> String{
        guard let thisDate = data else{
            return "DateConverterError"
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-YYYY hh:mm"
        return dateFormatter.string(from: thisDate)
        
    }
}
