//
//  CoreData.swift
//  project1
//
//  Created by хех on 27.01.2024.
//

import Foundation
import CoreData

final class CoreData{
    private lazy var persistentContainer : NSPersistentContainer = {
        let persistentContainer = NSPersistentContainer(name: "DataModel")
        persistentContainer.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error{
                print(error)
            }
        })
        return persistentContainer
    }()
    
    func save(){
        if persistentContainer.viewContext.hasChanges{
            do {
                try persistentContainer.viewContext.save()
            } catch {
                print(error)
            }
        }
    }
    
    func saveFriends(friends: [Friend]){
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FriendsData")
        for friend in friends {
            fetchRequest.predicate = NSPredicate(format: "id = %@" , argumentArray: [friend.id])
            let res = try? persistentContainer.viewContext.fetch(fetchRequest)
            guard res?.first == nil else {
                continue
            }
            let friendsModel = FriendsData(context: persistentContainer.viewContext)
            friendsModel.id = Int64(friend.id)
            friendsModel.booleanOnline = Int64(friend.booleanOnline ?? 0)
            friendsModel.firstName = friend.firstName
            friendsModel.lastName = friend.lastName
            friendsModel.photo = friend.photo
        }
        save()
//        add0
    }
    
    func getFriends() -> [Friend] {
        let fetchRequest: NSFetchRequest<FriendsData> = FriendsData.fetchRequest()
        guard let friends = try? persistentContainer.viewContext.fetch(fetchRequest) else {
            return []
        }
        var downloadedFriends: [Friend] = []
        for friend in downloadedFriends {
            downloadedFriends.append(Friend(id: Int(friend.id), firstName: friend.firstName,
                                            lastName: friend.lastName, photo: friend.photo, booleanOnline: Int(friend.booleanOnline ?? 0)))//почему требует распаковку?
        }
        return downloadedFriends
    }
    
    func saveGroups(groups: [Group]){
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "GroupsData")
        for group in groups {
            fetchRequest.predicate = NSPredicate(format: "id = %@" , argumentArray: [group.id])
            let res = try? persistentContainer.viewContext.fetch(fetchRequest)
            guard res?.first == nil else {
                continue
            }
            let groupsModel = GroupsData(context: persistentContainer.viewContext)
            groupsModel.id = Int64(group.id)
            groupsModel.name = group.name
            groupsModel.descr = group.descr
            groupsModel.photo50 = group.photo50
        }
        save()
//        add0
    }
    
    func getGroups()->[Group]{
        let fetchRequest: NSFetchRequest<GroupsData> = GroupsData.fetchRequest()
        guard let groups = try? persistentContainer.viewContext.fetch(fetchRequest) else {
            return []
        }
        var downloadedGroups: [Group] = []
        for group in downloadedGroups {
            downloadedGroups.append(Group(id: Int(group.id), name: group.name, photo50: group.photo50))//почему требует распаковку?
            
        }
        return downloadedGroups
    }
    
    func addFriendsDate(){
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FriendsData")
        let friendsDate = FriendsData(context: persistentContainer.viewContext)
        friendsDate.date = Date()
        save()
    }
    
    func fetchFriendsDate()->Date?{
        let fetchRequest: NSFetchRequest<FriendsData> = FriendsData.fetchRequest()
        guard let date = try? persistentContainer.viewContext.fetch(fetchRequest) else {
            return nil }
        return date.first?.date
    }
    
    func addFGroupsDate(){
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "GroupsData")
        let groupsDate = GroupsData(context: persistentContainer.viewContext)
        groupsDate.date = Date()
        save()
    }
    
    func fetchGroups()->Date?{
        let fetchRequest: NSFetchRequest<GroupsData> = GroupsData.fetchRequest()
        guard let date = try? persistentContainer.viewContext.fetch(fetchRequest) else {
            return nil }
        return date.first?.date
    }
}
