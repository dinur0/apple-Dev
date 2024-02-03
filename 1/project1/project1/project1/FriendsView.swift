//
//  FriendsView.swift
//  project1
//
//  Created by хех on 13.01.2024.
//

import UIKit

class FriendsView: UITableViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Friends"
        view.backgroundColor = #colorLiteral(red: 0.4338220026, green: 0.4338220026, blue: 0.4338220026, alpha: 1)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
}
//#Preview{
//    FriendsView()
//}
