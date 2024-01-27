//
//  ChangeThemeSubview.swift
//  project1
//
//  Created by хех on 27.01.2024.
//

import UIKit

protocol ThemeDelegateProtocol: AnyObject{
    func updateColor()
}

final class ChangeThemeSubview: UIView{
    weak var delegate: ThemeDelegateProtocol?
    
    private lazy var button1: UIButton = {
        let button1 = UIButton()
        button1.setTitle("Сменить на синюю тему", for: .normal)
        button1.backgroundColor = BlueTheme().backgroundColor
        button1.addTarget(self, action: #selector(tap1), for: .touchUpInside)
        return button1
    }()
    
    private lazy var button2: UIButton = {
        let button1 = UIButton()
        button1.setTitle("Сменить на красную тему", for: .normal)
        button1.backgroundColor = RedTheme().backgroundColor
        button1.addTarget(self, action: #selector(tap2), for: .touchUpInside)
        return button2
    }()
    
    private lazy var button3: UIButton = {
        let button1 = UIButton()
        button1.setTitle("Сменить на желтую тему", for: .normal)
        button1.backgroundColor = YellowTheme().backgroundColor
        button1.addTarget(self, action: #selector(tap3), for: .touchUpInside)
        return button3
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = Themes.currentTheme.backgroundColor
        setup()
    }
    
    func setup(){
        addSubview(button1)
        addSubview(button2)
        addSubview(button3)
        setConstraints()
    }
    
    func setConstraints(){
        button1.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false
        button3.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button1.centerXAnchor.constraint(equalTo: centerXAnchor),
            button1.centerYAnchor.constraint(equalTo: centerYAnchor),
            button1.heightAnchor.constraint(equalToConstant: 30),
            button1.widthAnchor.constraint(equalToConstant: 15),
            
            button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 20),
            button2.centerXAnchor.constraint(equalTo: centerXAnchor),
            button2.heightAnchor.constraint(equalTo: button1.heightAnchor),
            button2.widthAnchor.constraint(equalTo: button1.widthAnchor),
            
            button3.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 20),
            button3.centerXAnchor.constraint(equalTo: centerXAnchor),
            button3.heightAnchor.constraint(equalTo: button2.heightAnchor),
            button3.widthAnchor.constraint(equalTo: button2.widthAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

private extension ChangeThemeSubview{
    @objc func tap1(){
        Themes.currentTheme = BlueTheme()
        backgroundColor = Themes.currentTheme.backgroundColor
    }
    
    @objc func tap2(){
        Themes.currentTheme = BlueTheme()
        backgroundColor = Themes.currentTheme.backgroundColor
    }
    
    @objc func tap3(){
        Themes.currentTheme = BlueTheme()
        backgroundColor = Themes.currentTheme.backgroundColor
    }
}
