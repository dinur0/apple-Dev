import UIKit

class GroupsView: UITableViewController{
    
    private var model: [Group] = []
    private var cache = CoreData()
    private let groupsNet = NetworkServiceClass()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model = cache.getGroups()
        tableView.reloadData()
        title = "Groups"
        view.backgroundColor = Themes.currentTheme.backgroundColor
        tableView.backgroundColor = Themes.currentTheme.backgroundColor
        //        groupsNet.showGroups()
        tableView.register(CustomCellForGroups.self, forCellReuseIdentifier: "GRCell")
        
        downloadGroups()
        
    }
    @objc func downloadGroups(){
        groupsNet.showGroups{ [weak self] res in
            switch res {
            case .success(let groups):
                self?.model = groups
                self?.cache.saveGroups(groups: groups)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(_):
                self?.model = self?.cache.getGroups() ?? []
                DispatchQueue.main.async {
                    self?.getAlert()
                }
            }
            DispatchQueue.main.async {
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GRCell", for: indexPath) as? CustomCellForGroups else {
            return CustomCellForGroups()
        }
        let downloadedGroups = model[indexPath.row]
        cell.updateValues(groupsModel: downloadedGroups)
        return cell
    }
}

private extension GroupsView {
    func getAlert(){
        let errorData = DateConverter.convertData(data: cache.fetchFriendsDate())
        let alert = UIAlertController(title: "Ошибка получеия данных", message: "Ошибка произошла \(errorData)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Закрыть окно", style: .default, handler: nil))
        present(alert, animated: false, completion: nil)
    }
}
//#Preview{
//    GroupsView()
//}
