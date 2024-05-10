//
//  Webservice.swift
//  CoinTrackerApp
//
//  Created by Ceren Uludoğan on 8.05.2024.
//

//
//  Webservice.swift
//  Lesson-MVC
//
//  Created by Ceren Uludoğan on 6.05.2024.
//

import Foundation
import Alamofire

final class Webservice{
    
    static let shared = Webservice()
    
    private init() { }
    
    func fetchCoinList(completion: @escaping ([Coin]) -> ()) {
        AF.request("https://psp-merchantpanel-service-sandbox.ozanodeme.com.tr/api/v1/dummy/coins").responseDecodable(of: CoinDataModels.self) { response in
            switch response.result {
            case .success(let posts):
                completion(posts.data?.coins ?? [])
            case .failure(let error):
                print(error)
            }
        }
    }
}

