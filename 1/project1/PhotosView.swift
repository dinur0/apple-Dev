//
//  PhotosView.swift
//  project1
//
//  Created by хех on 13.01.2024.
//

import UIKit

class PhotosView: UICollectionViewController{
    
    private var model: [Photo] = []
    
    private let photosNet = NetworkServiceClass()
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        model.count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Photos"
        collectionView.backgroundColor = .blue
        collectionView.register(CustomCellPhotos.self, forCellWithReuseIdentifier: "thisCell")
//        photosNet.showPhotos()
        photosNet.showPhotos{ [weak self] arrayOfPhotos in
            self?.model = arrayOfPhotos
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "thisCell", for: indexPath) as? CustomCellPhotos else {
            return CustomCellPhotos()
        }
//        return cell
       
        let downloadedPhotos = model[indexPath.row]
        cell.updateValues(photosModel: downloadedPhotos)
        return cell
        }
    
}
/*
*/
extension PhotosView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let wigthOfView = UIScreen.main.bounds.width
        let SizeOFCell = wigthOfView / 2 - 20
        return CGSize(width: SizeOFCell, height: SizeOFCell)
    }
}

//#Preview{
//    PhotosView()
//}
