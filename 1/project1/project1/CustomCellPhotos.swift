//
//  CusttomCellPhotos.swift
//  project1
//
//  Created by хех on 13.01.2024.
//

import UIKit

final class CustomCellPhotos: UICollectionViewCell{
    
    private var cell = UIImageView(image: UIImage(systemName: "pencil"))
    
    private func setupUI(){
        contentView.addSubview(cell)
    }
    
    func updateValues(photosModel: Photo) {//JPG ----------------------------
        DispatchQueue.global().async{
            if let photoUrl = URL(string: photosModel.sizes.first?.url ?? "error"), let data = try? Data(contentsOf: photoUrl) {
                DispatchQueue.main.async {
                    self.cell.image = UIImage(data: data)
                }
            }
        }
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
