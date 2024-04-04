import UIKit

class FriendsView: UITableViewController{
    
    let netFriends = NetworkServiceClass()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Friends"
        view.backgroundColor = #colorLiteral(red: 0.4338220026, green: 0.4338220026, blue: 0.4338220026, alpha: 1)
//        netFriends.showFriends()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        5
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        FriendsTableCell()
    }
}
//#Preview{
//    FriendsView()
//}
