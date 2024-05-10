//
//  DetailViewController.swift
//  CoinTrackerApp
//
//  Created by Ceren Uludoğan on 8.05.2024.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    var coin: Coin?
    
    var sparklineData: [Double] = []


   
    @IBOutlet weak var coinRank: UILabel!
    @IBOutlet weak var coinImage: UIImageView!
    @IBOutlet weak var coinPrice: UILabel!
    @IBOutlet weak var lowLabel: UILabel!
    @IBOutlet weak var highLabel: UILabel!
    @IBOutlet weak var coinSymbol: UILabel!
    @IBOutlet weak var coinName: UILabel!
    @IBOutlet weak var cardView: UIView!{
        didSet{
            cardView.layer.borderWidth = 1
            cardView.layer.borderColor = UIColor(red: 38, green: 39, blue: 48, alpha: 1).cgColor
        }
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sparklineData = coin?.sparkline?.compactMap { Double($0) } ?? []
        
        drawSparkline()
       
        
          if let coin = coin {
         if let imageURL = coin.iconUrl {
         coinImage.kf.setImage(with: imageURL)
         } else {
         coinImage.image = UIImage(named: "defaultCoinImage")
         }
         if let priceString = coin.price, let priceDouble = Double(priceString) {
         let formattedPrice = String(format: "$%.2f", priceDouble)
         coinPrice.text = formattedPrice
         } else {
         coinPrice.text = "$0.00"
         }
         
         if let marketCapString = coin.marketCap, let marketCapDouble = Double(marketCapString) {
         let formattedMarketCapString = formattedMarketCap(marketCapDouble)
         highLabel.text = "MarketCap: \(formattedMarketCapString)"
         } else {
         highLabel.text = "MarketCap: 0"
         }
         
         if let listedAtInt = coin.listedAt {
         let formattedListedAtString = String(listedAtInt)
         let truncatedString = String(formattedListedAtString.prefix(5))
         lowLabel.text = "Listed At: \(truncatedString)"
         } else {
         lowLabel.text = "Listed At: 0"
         }
         
         
         coinName.text = coin.name ?? "Coin İsmi Yok"
         coinSymbol.text = coin.symbol ?? "Coin Sembolü Yok"
         coinRank.text = "rank: \(coin.rank ?? 0)"
         
         }
         
         func formattedMarketCap(_ marketCap: Double) -> String {
         let formatter = NumberFormatter()
         formatter.numberStyle = .decimal
         formatter.maximumFractionDigits = 0
         let formattedValue = formatter.string(from: NSNumber(value: marketCap)) ?? ""
         if formattedValue.count > 4 {
         return String(formattedValue.prefix(4))
         } else {
         return formattedValue
         }
         }
        
    }
        func drawSparkline() {
                let chartView = ChartView(frame: CGRect(x: 0, y: 128, width:  view.frame.width, height: 150))
            chartView.sparklineData = sparklineData
            chartView.backgroundColor = .white
                view.addSubview(chartView)
            }
            


    }
    

    


