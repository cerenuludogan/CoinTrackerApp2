//
//  TitleCell.swift
//  CoinTrackerApp
//
//  Created by Ceren Uludoğan on 4.05.2024.
//

import UIKit

final class TitleCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(title: String){
        titleLabel.text = title
    }
    
    
}
