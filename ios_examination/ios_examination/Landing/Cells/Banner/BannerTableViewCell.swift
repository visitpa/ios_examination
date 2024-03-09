//
//  BannerTableViewCell.swift
//  ios_examination
//
//  Created by Visit Patcharapanyapong on 9/3/2567 BE.
//

import UIKit

struct BannerTableViewCellModel {
    let images: [String]
}

class BannerTableViewCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pagerControl: UIPageControl!
    var images: [String] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        let nib = UINib(nibName: "BannerCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "BannerCollectionViewCell")
    }
    
    func setCell(model: BannerTableViewCellModel) {
        images = model.images
        pagerControl.numberOfPages = images.count
        collectionView.reloadData()
    }
}

extension BannerTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCollectionViewCell", for: indexPath) as? BannerCollectionViewCell else { return UICollectionViewCell() }
        cell.setCell(image: images[indexPath.item])
        return cell
    }
}

extension BannerTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: frame.width, height: 200)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentIndex = Int(scrollView.contentOffset.x / scrollView.frame.width)
        pagerControl.currentPage = currentIndex
    }
}
