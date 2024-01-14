//
//  CustomCell.swift
//  project1
//
//  Created by хех on 13.01.2024.
//

import UIKit

class CustomTableCell: UITableViewCell{
    
    private var label: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textAlignment = .center
        return label
    }()

    private var pictureInCell: UITableView = {
        let pictureInCell = UITableView()
        pictureInCell.backgroundColor = .orange
        pictureInCell.layer.cornerRadius = 25
        return pictureInCell
    }()
    
    func setup(){
        contentView.addSubview(label)
        contentView.addSubview(pictureInCell)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setup()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        pictureInCell.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            pictureInCell.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            pictureInCell.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            pictureInCell.heightAnchor.constraint(equalToConstant: 40),
            pictureInCell.widthAnchor.constraint(equalTo: pictureInCell.heightAnchor, constant: 20),
            
            label.topAnchor.constraint(equalTo: pictureInCell.topAnchor, constant: 0),
            label.leftAnchor.constraint(equalTo: pictureInCell.rightAnchor, constant: 0),
            label.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50)
        ])
    }
}
//#Preview{
//    FriendsView()
//}
