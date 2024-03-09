//
//  ListTableViewCell.swift
//  ios_examination
//
//  Created by Visit Patcharapanyapong on 9/3/2567 BE.
//

import UIKit

struct ListTableViewCellModel {
    let images: [String]
}

class ListTableViewCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    var images: [String] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
        selectionStyle = .none
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        let nib = UINib(nibName: "ListCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "ListCollectionViewCell")
    }
    
    func setCell(model: ListTableViewCellModel) {
        images = model.images
    }
}

extension ListTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListCollectionViewCell", for: indexPath) as? ListCollectionViewCell else { return UICollectionViewCell() }
        cell.setCell(image: images[indexPath.item])
        return cell
    }
}

extension ListTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 150, height: 150)
    }
}
