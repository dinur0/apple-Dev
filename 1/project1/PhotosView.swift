//
//  PhotosView.swift
//  project1
//
//  Created by хех on 13.01.2024.
//

import UIKit

class PhotosView: UICollectionViewController{
    
    private var model: [Photo] = []
    
    private let photosNet: NetworkProtocol
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        model.count
    }
    
    init(model: [Photo], photosNet: NetworkProtocol) {
        self.model = model
        self.photosNet = photosNet
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Photos"
        view.backgroundColor = Themes.currentTheme.backgroundColor
        collectionView.backgroundColor = Themes.currentTheme.backgroundColor
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
        let downloadedPhotos = model[indexPath.row]
        cell.updateValues(photosModel: downloadedPhotos)
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
