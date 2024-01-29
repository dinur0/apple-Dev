//
//  CustomCell.swift
//  project1
//
//  Created by хех on 13.01.2024.
//

import UIKit

class FriendsTableCell: UITableViewCell{
    
    var tap: ((String?, UIImage?)->Void)?
    
    private var label: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textAlignment = .center
        return label
    }()
    

    private var pictureInCell: UIImageView = {
        let pictureInCell = UIImageView()
        pictureInCell.backgroundColor = .orange
        pictureInCell.layer.cornerRadius = 25
        return pictureInCell
    }()
    
    func updateValues(friendsModel: Friend) {
        
        label.text = (friendsModel.firstName ?? "nil")+" "+(friendsModel.lastName ?? "nil")
        if let online = friendsModel.booleanOnline {
            let isOn = online == 1
                if isOn {
                    label.textColor = #colorLiteral(red: 0, green: 1, blue: 0.1462361823, alpha: 1)
                } else {
                    label.textColor = #colorLiteral(red: 1, green: 0, blue: 0.09760022642, alpha: 1)
                }
            }
        DispatchQueue.global().async{
            if let photoUrl = URL(string: friendsModel.photo ?? "error"), let data = try? Data(contentsOf: photoUrl) {
                DispatchQueue.main.async {
                    self.pictureInCell.image = UIImage(data: data)
                    self.pictureInCell.layer.cornerRadius = 25
                }
            }
        }
        
    }
    
    
    func setup(){
        contentView.addSubview(label)
        contentView.addSubview(pictureInCell)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        let recognizer = UITapGestureRecognizer(target: self, action: #selector())
        addGestureRecognizer(recognizer)
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
            pictureInCell.heightAnchor.constraint(equalToConstant: 50),
            pictureInCell.widthAnchor.constraint(equalTo: pictureInCell.heightAnchor, constant: 0),
            
            label.topAnchor.constraint(equalTo: pictureInCell.topAnchor, constant: 0),
            label.leftAnchor.constraint(equalTo: pictureInCell.rightAnchor, constant: 0),
            label.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -30),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50),

        ])
    }
    
    @objc func click(){
        tap?(label.text, pictureInCell.image)
    }
}
//#Preview{
//    FriendsView()
//}
