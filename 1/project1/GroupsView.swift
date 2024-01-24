import UIKit

class GroupsView: UITableViewController{
    
    private var model: [Group] = []
    
    private let groupsNet = NetworkServiceClass()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Groups"
        view.backgroundColor = #colorLiteral(red: 0.4338220026, green: 0.4338220026, blue: 0.4338220026, alpha: 1)
//        groupsNet.showGroups()
        tableView.register(CustomCellForGroups.self, forCellReuseIdentifier: "GRCell")
        groupsNet.showGroups{ [weak self] arrayOfGroups in
            self?.model = arrayOfGroups
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GRCell", for: indexPath) as? CustomCellForGroups else {
            return CustomCellForGroups()
        }
        let downloadedGroups = model[indexPath.row]
        cell.updateValues(groupsModel: downloadedGroups)
        return cell
    }
}
//#Preview{
//    GroupsView()
//}
