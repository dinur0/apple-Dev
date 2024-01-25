//
//  NetworkServiceClass.swift
//  project3 SwiftUI
//
//  Created by хех on 25.01.2024.
//

import Foundation

class NetworkServiceClass{
    func downloadNews(handler:@escaping ([News])->()) {
        guard let url = URL(string: "https://kudago.com/public-api/v1.2/news/?actual_only=true") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
        guard let data = data else {return}
        do {
            let news = try JSONDecoder().decode(NewsStructure.self, from: data)
            handler(news.results) }
        catch {
            print(error)
        }
    }.resume()
    }
}
