//
//  NetworkServiceClass.swift
//  project1
//
//  Created by хех on 18.01.2024.
//

import Foundation

final class NetworkServiceClass {
    
    private let thisSession = URLSession.shared
    
    static var networkToken = ""
    
    func showFriends(handler: @escaping ([Friend]) -> Void){
        guard let url = URL(string: "https://api.vk.com/method/friends.get?fields=photo_100,online&access_token=\(NetworkServiceClass.networkToken)&v=5.131")
        else {
            return
        }
//        print(url)
        
        thisSession.dataTask(with: url) { (data, _, error) in
            guard let data else{
                return
            }
            do {
                let friendsData = try JSONDecoder().decode(FriendsStructure.self, from: data)
                handler(friendsData.response.items)
//                print(friendsData)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func showGroups(handler: @escaping ([Group]) -> Void){
        guard let url = URL(string: "https://api.vk.com/method/groups.get?extended=1&count=3&fields=photo_50,description&access_token=\(NetworkServiceClass.networkToken)&v=5.131") // выводит 3 группы
        else {
            return
        }
//        print(url)
        
        thisSession.dataTask(with: url) { (data, _, error) in
            guard let data else{
                return
            }
            do {
                let groupsData = try JSONDecoder().decode(GroupsStructure.self, from: data)
                handler(groupsData.response.items)
//                print(groupsData)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func showPhotos(handler: @escaping ([Jpg]) -> Void){ //ТУТ НАДО jpg -----------------
        guard let url = URL(string: "https://api.vk.com/method/photos.get?count=3&album_id=profile&access_token=\(NetworkServiceClass.networkToken)&v=5.131")
        else {
            return	
        }
        print(url)
        
        thisSession.dataTask(with: url) { (data, _, error) in
            guard let data else{
                return
            }
            do {
                let photosData = try JSONDecoder().decode(PhotoStructure.self, from: data)
                handler(photosData.response.items.sizes)
                print(photosData)
            } catch {
                print(error)
            }
        }.resume()
    }
}
