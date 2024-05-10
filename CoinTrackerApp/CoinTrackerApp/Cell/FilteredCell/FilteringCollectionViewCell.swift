//
//  FilteringCollectionViewCell.swift
//  CoinTrackerApp
//
//  Created by Ceren Uludoğan on 8.05.2024.
//

import UIKit

class FilteringCollectionViewCell: UICollectionViewCell {

  
    @IBOutlet weak var btn: UIButton!
    var buttonTapped: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    @IBAction func btnClicked(_ sender: UIButton) {
        buttonTapped?()
        print("Tıklandı")
    }
}
