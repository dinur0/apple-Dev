//
//  NetworkServiceClass.swift
//  project1
//
//  Created by хех on 18.01.2024.
//

import Foundation

protocol NetworkProtocol: AnyObject{
    func showFriends(handler: @escaping (Result<[Friend], Error>) -> Void)
    func showGroups(handler: @escaping (Result<[Group], Error>) -> Void)
    func showPhotos(handler: @escaping ([Photo]) -> Void)
    func showProfile(handler: @escaping ([Profile]) -> Void)
}

final class NetworkServiceClass: NetworkProtocol {
    
    private let thisSession = URLSession.shared
    
    static var networkToken = ""
    
    func showFriends(handler: @escaping (Result<[Friend], Error>) -> Void){
        guard let url = URL(string: "https://api.vk.com/method/friends.get?fields=photo_100,online&access_token=\(NetworkServiceClass.networkToken)&v=5.131")
        else {
            handler(.failure(MyNetworkErrors.dataError))
            return
        }
        //print(url)
        
        thisSession.dataTask(with: url) { (data, _, error) in
            guard let data else{
                handler(.failure(MyNetworkErrors.dataError))
                return
            }
            if let error{
                handler(.failure(MyNetworkErrors.dataError))
                print(error)
            }
            do {
                let friendsData = try JSONDecoder().decode(FriendsStructure.self, from: data)
                handler(.success(friendsData.response.items))
                //print(friendsData)
            } catch {
                handler(.failure(error))
            }
        }.resume()
    }
    
    func showGroups(handler: @escaping (Result<[Group], Error>) -> Void){
        guard let url = URL(string: "https://api.vk.com/method/groups.get?extended=1&count=3&fields=photo_50,description&access_token=\(NetworkServiceClass.networkToken)&v=5.131") // выводит 3 группы
        else {
            handler(.failure(MyNetworkErrors.dataError))
            return
        }
        //        print(url)
        
        thisSession.dataTask(with: url) { (data, _, error) in
            guard let data else{
                handler(.failure(MyNetworkErrors.dataError))
                return
            }
            if let error{
                handler(.failure(MyNetworkErrors.dataError))
                print(error)
            }
            do {
                let groupsData = try JSONDecoder().decode(GroupsStructure.self, from: data)
                handler(.success(groupsData.response.items))
                //                print(groupsData)
            } catch {
                handler(.failure(error))
            }
        }.resume()
    }
    
    func showPhotos(handler: @escaping ([Photo]) -> Void){
        guard let url = URL(string: "https://api.vk.com/method/photos.get?count=3&album_id=profile&access_token=\(NetworkServiceClass.networkToken)&v=5.131")
        else {
            return
        }
        //        print(url)
        
        thisSession.dataTask(with: url) { (data, _, error) in
            guard let data else{
                return
            }
            do {
                let photosData = try JSONDecoder().decode(PhotoStructure.self, from: data)
                handler(photosData.response.items)
                //                print(photosData)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func showProfile(handler: @escaping ([Profile]) -> Void){
        guard let url=URL(string: "https://api.vk.com/method/users.get?fields=photo_400_orig&access_token=\(NetworkServiceClass.networkToken)&v=5.131")
        else {
            return
        }
        print(url)
        
        thisSession.dataTask(with: url) { (data, _, error) in
            guard let data else{
                return
            }
            do {
                let userData = try JSONDecoder().decode(ProfileStructure.self, from: data)
                handler(userData.response)
                print(userData)
            } catch {
                print(error)
            }
        }.resume()
    }
}

extension NetworkServiceClass {
    enum MyNetworkErrors: Error{
        case dataError
    }
}
