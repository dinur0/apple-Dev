//
//  ProfileView.swift
//  project1
//
//  Created by хех on 24.01.2024.
//

import UIKit

class ProfileView: UIViewController, ThemeDelegateProtocol{
    
    private var model: Profile?
//    private let profileNet = NetworkServiceClass()
    private var profileNet: NetworkProtocol
    private var isUser: Bool
    private var themeColorView = ChangeThemeSubview() //HERE
    
    private var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = ""
        return label
    }()
    
    private var image: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .brown
        image.layer.cornerRadius = 105
        return image
    }()
    
    init(name: String? = nil, photo: UIImage? = nil, isUser: Bool, profileNet: NetworkProtocol) {
        
        self.isUser = isUser
        self.profileNet = profileNet
        super.init(nibName: nil, bundle: nil)
        label.text = name
        image.image = photo
        themeColorView.delegate = self
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "PROFILE!!!!!!!!"
        view.backgroundColor = Themes.currentTheme.backgroundColor
        setup()
        addConstraints()
        if isUser{
            profileNet.showProfile{ [weak self] arrayOfProfile in
                self?.model = arrayOfProfile.first
                self?.updateValues(profileModel: arrayOfProfile.first!)
            }
        } else {
            themeColorView.isHidden = true
        }
    }
    
    func setup(){
        view.addSubview(label)
        view.addSubview(image)
        view.addSubview(themeColorView)
    }
    
    func updateValues(profileModel: Profile){
        //            label.text = (profileModel.firstName ?? "nil")+" "+(profileModel.lastName ?? "nil")
        DispatchQueue.global().async{
            DispatchQueue.main.async {
                self.label.text = (profileModel.firstName ?? "nil")+" "+(profileModel.lastName ?? "nil")
            }
            if let profileUrl = URL(string: profileModel.photo ?? "error"), let data = try? Data(contentsOf: profileUrl) {
                DispatchQueue.main.async {
                    self.image.image = UIImage(data: data)
                    self.image.layer.cornerRadius = 105
                    
                }
            }
        }
    }
    
    func updateColor() {
        view.backgroundColor = Themes.currentTheme.backgroundColor
    }
    
    func addConstraints() {
        label.translatesAutoresizingMaskIntoConstraints=false
        image.translatesAutoresizingMaskIntoConstraints=false
        themeColorView.translatesAutoresizingMaskIntoConstraints=false
        
        NSLayoutConstraint.activate([
            
            image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant:20),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.heightAnchor.constraint(equalToConstant: view.frame.size.height / 4),
            image.widthAnchor.constraint(equalTo: image.heightAnchor),
            
            label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 20),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.widthAnchor.constraint(equalTo: image.widthAnchor),
            label.heightAnchor.constraint(equalToConstant: view.frame.size.height / 10),
            
            themeColorView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            themeColorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}
//#Preview{
//    ProfileView(isUser: true)
//}
