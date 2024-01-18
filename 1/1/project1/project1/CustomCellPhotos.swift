//
//  CusttomCellPhotos.swift
//  project1
//
//  Created by хех on 13.01.2024.
//

import UIKit

final class CustomCellPhotos: UICollectionViewCell{
    
    private let cell = UIImageView(image: UIImage(systemName: "pencil"))
    
    private func setupUI(){
        contentView.addSubview(cell)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        addConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraint() {
        cell.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            cell.topAnchor.constraint(equalTo: contentView.topAnchor),
            cell.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            cell.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            cell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
}
