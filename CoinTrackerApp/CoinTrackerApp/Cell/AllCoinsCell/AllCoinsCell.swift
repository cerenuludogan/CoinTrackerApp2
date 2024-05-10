//
//  HomeTableViewCell.swift
//  CoinTrackerApp
//
//  Created by Ceren Uludoğan on 2.05.2024.
//

import UIKit
import Kingfisher
class AllCoinsCell: UITableViewCell {

    @IBOutlet weak var coinChange: UILabel!
    @IBOutlet weak var coinImageView: UIImageView!
    
    @IBOutlet weak var coinSymbol: UILabel!
    
    @IBOutlet weak var coinPrice: UILabel!
    @IBOutlet weak var coinName: UILabel!
    override func awakeFromNib() {
            super.awakeFromNib()
            setupGradient()
        
        }
        
        private func setupGradient() {
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = bounds
            gradientLayer.colors = [UIColor(red: 0.078, green: 0.118, blue: 0.188, alpha: 1.0).cgColor, UIColor(red: 0.141, green: 0.231, blue: 0.333, alpha: 1.0).cgColor]
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
            contentView.layer.insertSublayer(gradientLayer, at: 0)
        }

    func setupCell(coin: Coin){
        if let imageURL = coin.iconUrl {
                coinImageView.kf.setImage(with: imageURL)
            } else {
                coinImageView.image = UIImage(named: "defaultCoinImage")
            }
       
        
            if let priceString = coin.price, let priceDouble = Double(priceString) {
                let formattedPrice = String(format: "$%.2f", priceDouble)
                coinPrice.text = formattedPrice
            } else {
                coinPrice.text = "$0.00"
            }

        coinSymbol.text = coin.symbol ?? ""
        coinName.text = coin.name ?? ""
        coinChange.text = coin.change ?? ""
        if let change = coin.change, let changeValue = Double(change) {
                if changeValue < 0 {
                    coinChange.textColor = UIColor.systemRed
                } else if changeValue > 0 {
                    coinChange.textColor = UIColor.systemGreen
                } else {
                    coinChange.textColor = UIColor.black
                }
            } else {
                coinChange.textColor = UIColor.black
            }
    }

    
}
