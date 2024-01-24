//
//  ProfileView.swift
//  project1
//
//  Created by хех on 24.01.2024.
//

import UIKit

class ProfileView: UIViewController{
    
    private var model: Profile
    
    private let profileNet = NetworkServiceClass()
    
    private var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "FFFFFFFF"
        return label
    }()
    
    private var image: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .brown
        image.layer.cornerRadius = 105
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "PROFILE!!!!!!!!"
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        profileNet.showProfile{ [weak self] arrayOfProfile in
            self?.model = arrayOfProfile
//            DispatchQueue.main.async {
//                self?.view.reloadData()
//            }
        }
        setup()
        addConstraints()
    }
    
    private func setup(){
        view.addSubview(label)
        view.addSubview(image)
    }
    
    
    
    private func addConstraints() {
        label.translatesAutoresizingMaskIntoConstraints=false
        image.translatesAutoresizingMaskIntoConstraints=false
        
        NSLayoutConstraint.activate([
            
            image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant:20),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.heightAnchor.constraint(equalToConstant: view.frame.size.height / 4),
            image.widthAnchor.constraint(equalTo: image.heightAnchor),
            
            label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 20),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.widthAnchor.constraint(equalTo: image.widthAnchor),
            label.heightAnchor.constraint(equalToConstant: view.frame.size.height / 10)
        
        ])
    }
    
    

}

//#Preview{
//    ViewController()
//}
