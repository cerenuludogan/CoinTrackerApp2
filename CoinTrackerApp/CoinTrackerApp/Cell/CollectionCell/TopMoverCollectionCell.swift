//
//  DenemeCell.swift
//  CoinTrackerApp
//
//  Created by Ceren Uludoğan on 4.05.2024.
//

import UIKit
import Kingfisher

class TopMoverCollectionCell: UICollectionViewCell {

  
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    private let gradientLayer = CAGradientLayer()

        // init ve setupGradient fonksiyonu burada

        override func layoutSubviews() {
            super.layoutSubviews()
            gradientLayer.frame = bounds
        }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupGradient()
    }

    private func setupGradient() {
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = bounds
            gradientLayer.colors = [UIColor(red: 0.263, green: 0.808, blue: 0.635, alpha: 1.0).cgColor, UIColor(red: 0.094, green: 0.353, blue: 0.615, alpha: 1.0).cgColor]
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
            layer.insertSublayer(gradientLayer, at: 0)
        
        }
    func setupCell(coin: Coin){
        if let imageURL = coin.iconUrl {
            imageView.kf.setImage(with: imageURL)
            } else {
                // Eğer resim URL'si yoksa, varsayılan resmi kullanabilirsiniz
                imageView.image = UIImage(named: "defaultCoinImage")
            }
        symbolLabel.text = coin.symbol
        nameLabel.text = coin.name
    }
    override init(frame: CGRect) {
            super.init(frame: frame)
            setupGradient()
        }
        
        

}
