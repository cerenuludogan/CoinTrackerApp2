//
//  CollectionTableViewCell.swift
//  CoinTrackerApp
//
//  Created by Ceren Uludoğan on 3.05.2024.
//

//CollectionCell'i kullandığımız sınıf

import UIKit

class TopMoversTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
   
        
    private var coin: [Coin] = []
    override func awakeFromNib() {
        super.awakeFromNib()

        collectionView.dataSource = self
        collectionView.delegate = self
        
        registerCell()

    }
    
    private func registerCell(){
        let TopMoverCollectionCellName = String(describing: TopMoverCollectionCell.self)
        let TopMoverCollectionCellNib = UINib(nibName: TopMoverCollectionCellName, bundle: .main)
        collectionView.register(TopMoverCollectionCellNib, forCellWithReuseIdentifier: TopMoverCollectionCellName)
    }
    
    func prepareCell(with coin: [Coin]) {
        self.coin = coin
        collectionView.reloadData()
    }

    
}

extension TopMoversTableViewCell: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return coin.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: TopMoverCollectionCell.self), for: indexPath) as? TopMoverCollectionCell {  
            cell.setupCell(coin: coin[indexPath.item])
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 200, height: 200)
        }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
           cell.alpha = 0
           cell.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
           UIView.animate(withDuration: 0.5) {
               cell.alpha = 1
               cell.transform = .identity
           }
       }
    
}


