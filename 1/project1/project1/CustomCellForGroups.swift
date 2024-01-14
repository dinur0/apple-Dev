//
//  CustomCell.swift
//  project1
//
//  Created by хех on 13.01.2024.
//

import UIKit

class CustomCellForGroups: UITableViewCell{
    
    private var label: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textAlignment = .center
        return label
    }()
    
    private var label2: UILabel = {
        let label2 = UILabel()
        label2.text = "Description"
        label2.textAlignment = .center
        return label2
    }()

    private var pictureInCell: UITableView = {
        let pictureInCell = UITableView()
        pictureInCell.backgroundColor = .red
        pictureInCell.layer.cornerRadius = 25
        return pictureInCell
    }()
    
    func setup(){
        contentView.addSubview(label)
        contentView.addSubview(label2)
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
        label2.translatesAutoresizingMaskIntoConstraints = false
        pictureInCell.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            pictureInCell.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            pictureInCell.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            pictureInCell.heightAnchor.constraint(equalToConstant: 40),
            pictureInCell.widthAnchor.constraint(equalTo: pictureInCell.heightAnchor, constant: 20),
            
            label.topAnchor.constraint(equalTo: pictureInCell.topAnchor),
            label.leftAnchor.constraint(equalTo: pictureInCell.rightAnchor, constant: 0),
            label.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            
            label2.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
            label2.leftAnchor.constraint(equalTo: label.leftAnchor),
            label2.rightAnchor.constraint(equalTo: label.rightAnchor),
            label2.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
            
            
        ])
    }
}
#Preview{
    GroupsView()
}
