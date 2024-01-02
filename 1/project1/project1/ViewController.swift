//
//  ViewController.swift
//  project1
//
//  Created by хех on 01.01.2024.
//

import UIKit

    class ViewController: UIViewController{

        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white
            setupUI()
        }

        private var image1: UIImageView = {
            let image = UIImageView(image: UIImage(systemName: "person"))
//            image.frame = CGRect(x: 50, y: 400, width: 200, height: 200)
            image.backgroundColor = .yellow
            return image
        }()
        
        private var text1: UITextField = {
            let text = UITextField()
            text.backgroundColor = .gray
            text.textAlignment = .center
            text.text = "Логин"
            return text
        }()
        
        private var text2: UITextField = {
            let text = UITextField()
            text.backgroundColor = .brown
            text.textAlignment = .center
            text.text = "Пароль"
            return text
        }()

        private var label1: UILabel = {
            let label = UILabel()
            label.text = "Авторизация"
            label.textAlignment = .center
            label.textColor = .black
            label.backgroundColor = .green
            return label
        }()

        private var button1 = UIButton()
        
        private func addButton(){
            button1.setTitle ("Войти", for: .normal)
            button1.setTitleColor(.darkGray, for: .normal)
            button1.backgroundColor = .yellow
        }

        private func setupUI() {
            addButton()
            view.addSubview(image1)
            view.addSubview(label1)
            view.addSubview(button1)
            view.addSubview(text1)
            view.addSubview(text2)
            addConstrains()
        }

        private func addConstrains() {
            label1.translatesAutoresizingMaskIntoConstraints = false
            button1.translatesAutoresizingMaskIntoConstraints = false
            text1.translatesAutoresizingMaskIntoConstraints = false
            text2.translatesAutoresizingMaskIntoConstraints = false
            image1.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                
                image1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                image1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
                image1.widthAnchor.constraint(equalToConstant: view.frame.size.width*0.75),
                image1.heightAnchor.constraint(equalToConstant: view.frame.size.height*0.20),

                label1.topAnchor.constraint(equalTo: image1.bottomAnchor, constant: 10),
                label1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                label1.widthAnchor.constraint(equalToConstant: view.frame.size.width*0.9),
                label1.heightAnchor.constraint(equalToConstant: view.frame.size.height*0.05),
                
                text1.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 10),
                text1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                text1.widthAnchor.constraint(equalToConstant: view.frame.size.width*0.6),
                text1.heightAnchor.constraint(equalToConstant: view.frame.size.height*0.05),
                
                text2.topAnchor.constraint(equalTo: text1.bottomAnchor, constant: 10),
                text2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                text2.widthAnchor.constraint(equalToConstant: view.frame.size.width*0.6),
                text2.heightAnchor.constraint(equalToConstant: view.frame.size.height*0.05),
                
                button1.topAnchor.constraint(equalTo: text2.bottomAnchor, constant: 10),
                button1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                button1.widthAnchor.constraint(equalToConstant: view.frame.size.width*0.9	),
                button1.heightAnchor.constraint(equalToConstant: view.frame.size.height*0.07),
            ])
        }
    }

#Preview{
    ViewController()
}




