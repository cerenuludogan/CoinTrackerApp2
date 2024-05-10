//
//HomeViewController.swift
//  CoinTrackerApp
//
//  Created by Ceren Uludoğan on 3.05.2024.
//

import UIKit

enum CoinTableCellType {
    case search
    case title(String)
    case allCoin([Coin])
    case topMover([Coin])
    case filtiring
}

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let searchController = UISearchController(searchResultsController: nil)
    var celltypeList: [CoinTableCellType] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        Webservice.shared.fetchCoinList { coinList in
            self.celltypeList.append(.search)
            self.celltypeList.append(.title("Top Mover"))
            self.celltypeList.append(.topMover(coinList))
            self.celltypeList.append(.title("All Coins"))
            self.celltypeList.append(.filtiring)
            self.celltypeList.append(.allCoin(coinList))
            self.tableView.reloadData()
        }
    
        registerCells()
       
    }
    
    

    private func registerCells() {
        
        let searchCellName = String(describing: SearchTableViewCell.self)
        let searchCellNib = UINib(nibName: searchCellName, bundle: .main)
        tableView.register(searchCellNib, forCellReuseIdentifier: searchCellName)
        
        let topMoversCellName = String(describing: TopMoversTableViewCell.self)
        let topMoversCellNib = UINib(nibName: topMoversCellName, bundle: nil)
        tableView.register(topMoversCellNib, forCellReuseIdentifier: topMoversCellName)
        
        let filtiringCellName = String(describing: FilteringTableViewCell.self)
        let filtiringCellNib = UINib(nibName: filtiringCellName, bundle: .main)
        tableView.register(filtiringCellNib, forCellReuseIdentifier: filtiringCellName)
        
        
        let AllCoinsCellName = String(describing: AllCoinsCell.self)
        let AllCoinsCellNib = UINib(nibName: AllCoinsCellName, bundle: nil)
        tableView.register(AllCoinsCellNib, forCellReuseIdentifier: AllCoinsCellName)
        
        let titleCellName = String(describing: TitleCell.self)
        let titleCellNib = UINib(nibName: titleCellName, bundle: .main)
        tableView.register(titleCellNib, forCellReuseIdentifier: titleCellName)
        
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return celltypeList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch celltypeList[section] {
        case .search, .title, .topMover, .filtiring:
            return 1
        case .allCoin(let coinList):
            return coinList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch celltypeList[indexPath.section] {
        case .search:
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SearchTableViewCell.self), for: indexPath) as? SearchTableViewCell {
                return cell
            }
        case .title(let title):
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TitleCell.self)) as? TitleCell {
                cell.setupCell(title: title)
                
                return cell
            }
        case .topMover(let coinList):
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TopMoversTableViewCell.self), for: indexPath) as? TopMoversTableViewCell {
                cell.prepareCell(with: coinList)
                return cell
            }
        case .allCoin(let coinList):
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: AllCoinsCell.self), for: indexPath) as? AllCoinsCell {
                cell.setupCell(coin: coinList[indexPath.row])
                return cell
            }
        case .filtiring:
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FilteringTableViewCell.self), for: indexPath) as? FilteringTableViewCell {
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 2 {
            return 150.0
        } else {
            return UITableView.automaticDimension
        }
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch celltypeList[indexPath.section] {
        case .allCoin(let coinList):
                let selectedCoin = coinList[indexPath.row]
                performSegue(withIdentifier: "ToDetailVC", sender: selectedCoin)
                print("Tüm paralar tıklandı.")
            // Diğer case'ler
            
        case .title(_):
            break
        case .topMover:
            break
        case .search:
            break
        case .filtiring:
            break
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToDetailVC" {
            if let destinationVC = segue.destination as? DetailViewController {
                if let selectedCoin = sender as? Coin {
                    destinationVC.coin = selectedCoin
                }
            }
        }
    }
}
    
    extension UIView {
        @IBInspectable var cornerRadius: CGFloat {
            get {
                return layer.cornerRadius
            }
            set {
                layer.cornerRadius = newValue
            }
        }
    }

