//
//  NetworkServiceClass.swift
//  project1
//
//  Created by хех on 18.01.2024.
//

import Foundation

final class NetworkServiceClass {
    
    private let thisSession = URLSession.shared
    
//    static var networkToken = "OKV821lM7WOxqlwtSLEW"
    static var networkToken = ""
    
    func showFriends(){
        guard let url = URL(string: "https://api.vk.com/method/friends.get?fields=photo_100&access_token=\(NetworkServiceClass.networkToken)&v=5.131") else {
            return
        }
        
        thisSession.dataTask(with: url) { (data, _, error) in
            guard let data else{
                return
            }
            do {
                let friendsData = try JSONDecoder().decode([FriendsStructure].self, from: data)
                print(friendsData)
            } catch {
                print(error)
            }
        }.resume()
    }
}
