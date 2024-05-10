//
//  SearchTableViewCell.swift
//  CoinTrackerApp
//
//  Created by Ceren Uludoğan on 8.05.2024.
//

import UIKit
protocol SearchViewControllerDelegate: AnyObject {
    var isSearchBarEmpty: Bool { get }
    var isFiltering: Bool { get }
}

class SearchTableViewCell: UITableViewCell {
    @IBOutlet weak var searchBar: UISearchBar!
    weak var delegate: SearchViewControllerDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
