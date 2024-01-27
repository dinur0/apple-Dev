import UIKit

class FriendsView: UITableViewController{
    
    private let netFriends = NetworkServiceClass()
    
    private var model: [Friend] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Friends"
        view.backgroundColor = Themes.currentTheme.backgroundColor
        tableView.backgroundColor = Themes.currentTheme.backgroundColor
        tableView.register(FriendsTableCell.self, forCellReuseIdentifier: "FRCell")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "pencil"), style: .plain, target: self, action: #selector(tapToProfile) )
        netFriends.showFriends{ [weak self] arrayOfFriends in
            self?.model = arrayOfFriends
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
    }
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        5
//    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        FriendsTableCell()
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FRCell", for: indexPath) as? FriendsTableCell else {
            return FriendsTableCell()
        }
        let downloadedFriends = model[indexPath.row]
        cell.updateValues(friendsModel: downloadedFriends)
        return cell
    }
}

extension UITableViewController {
    @objc func tapToProfile(){
//        let view = ProfileView()
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        animation.type = .fade
        animation.duration = 1
        navigationController?.view.layer.add(animation, forKey: nil)
        navigationController?.pushViewController(ProfileView(), animated: false)
//        navigationController?.pushViewController(ProfileView, animated: false)
    }
}
//#Preview{
//    FriendsView()
//}
