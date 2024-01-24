import UIKit

class FriendsView: UITableViewController{
    
    private let netFriends = NetworkServiceClass()
    
    private var model: [Friend] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Friends"
        view.backgroundColor = #colorLiteral(red: 0.4338220026, green: 0.4338220026, blue: 0.4338220026, alpha: 1)
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
//        navigationController?.pushViewController(view, animated: false)
    }
}
//#Preview{
//    FriendsView()
//}
