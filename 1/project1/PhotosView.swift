//
//  PhotosView.swift
//  project1
//
//  Created by хех on 13.01.2024.
//

import UIKit

class PhotosView: UICollectionViewController{
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Photos"
        collectionView.backgroundColor = .blue
        collectionView.register(CustomCellPhotos.self, forCellWithReuseIdentifier: "thisCell")
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "thisCell", for: indexPath)
        return cell
    }
    
}

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
