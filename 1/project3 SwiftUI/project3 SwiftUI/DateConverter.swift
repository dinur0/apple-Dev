//
//  DateConverter.swift
//  project3 SwiftUI
//
//  Created by хех on 25.01.2024.
//

import Foundation

class DateConverter{
    func convertData(date: Double) -> String{
        let data = Date(timeIntervalSince1970: date)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-YYYY"
        return dateFormatter.string(from: data)
        
    }
}
