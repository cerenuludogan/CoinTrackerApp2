//
//  FilteringTableViewCell.swift
//  CoinTrackerApp
//
//  Created by Ceren Uludoğan on 8.05.2024.
//

import UIKit

class FilteringTableViewCell: UITableViewCell {
    private var filteringBtnTitles: [String] = ["24h Vol", "Price", "Change", "ListedAt", "Market Cap"]
    var buttonTapped: ((Int) -> Void)?
    @IBOutlet weak var collectionview: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionview.dataSource = self
        collectionview.dataSource = self
        
        registerCell()

    }

    private func registerCell(){
        let filteringCollecitonCellName = String(describing: FilteringCollectionViewCell.self)
        let filteringCollectionCellNib = UINib(nibName: filteringCollecitonCellName, bundle: .main)
        collectionview.register(filteringCollectionCellNib, forCellWithReuseIdentifier: filteringCollecitonCellName)
    }
}
extension FilteringTableViewCell: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteringBtnTitles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: FilteringCollectionViewCell.self), for: indexPath) as? FilteringCollectionViewCell {
            cell.btn.setTitle(filteringBtnTitles[indexPath.item], for: .normal)
                        
                        cell.buttonTapped = { [weak self] in
                            // Buton tıklandığında olayı iletmek için
                            self?.buttonTapped?(indexPath.item)
                        }

                        return cell
        }
        return UICollectionViewCell()
    }
    
    
}
