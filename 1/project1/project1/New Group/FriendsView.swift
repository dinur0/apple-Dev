import UIKit

final class FriendsView: UITableViewController{
    
    private let netFriends = NetworkServiceClass()
    private var cache = CoreData()
    private var model: [Friend] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model = cache.getFriends()
        tableView.reloadData()
        title = "Friends"
        view.backgroundColor = Themes.currentTheme.backgroundColor
        tableView.backgroundColor = Themes.currentTheme.backgroundColor
        tableView.register(FriendsTableCell.self, forCellReuseIdentifier: "FRCell")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "pencil"), style: .plain, target: self, action: #selector(tapToProfile))
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(downloadFriends), for: .valueChanged)
        downloadFriends()
        
    }
    
    @objc func downloadFriends(){
        netFriends.showFriends{ [weak self] res in
            switch res {
            case .success(let friends):
                self?.model = friends
                self?.cache.saveFriends(friends: friends)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(_):
                self?.model = self?.cache.getFriends() ?? []
                DispatchQueue.main.async {
                    self?.getAlert()
                }
            }
            DispatchQueue.main.async {
                self?.refreshControl?.attributedTitle = NSAttributedString(string: "Обновление списка...")//Задание 4
                self?.refreshControl?.endRefreshing()
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
        cell.tap = { [weak self] text, photo in
            self?.navigationController?.pushViewController(ProfileView(name: text, photo: photo, isUser: false), animated: true)
            
        }
        return cell
    }
}

private extension FriendsView {
    func getAlert(){
        let errorData = DateConverter.convertData(data: cache.fetchFriendsDate())
        let alert = UIAlertController(title: "Ошибка получеия данных", message: "Ошибка произошла \(errorData)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Закрыть окно", style: .default, handler: nil))
        present(alert, animated: false, completion: nil)
    }
    
    @objc func tapToProfile(){
        //        let view = ProfileView()
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        animation.type = .fade
        animation.duration = 1
        navigationController?.view.layer.add(animation, forKey: nil)
        navigationController?.pushViewController(ProfileView(isUser: true), animated: false)
        //        navigationController?.pushViewController(ProfileView, animated: false)
    }
}
//#Preview{
//    FriendsView()
//}
