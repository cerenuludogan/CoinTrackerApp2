//
//  Coin.swift
//  CoinTrackerApp
//
//  Created by Ceren Uludoğan on 8.05.2024.
//


import Foundation

struct CoinDataModels: Decodable {
    let status: String?
    let data: CoinData?
}


struct CoinData: Decodable {
    let coins: [Coin]?
}

struct Coin: Decodable {
    let uuid: String?
    let symbol: String?
    let name: String?
    let iconUrl: URL?
    let price: String?
    let listedAt: Int?
    let change: String?
    let rank: Int?
    let marketCap: String?
    let sparkline: [String]?
    let volume24: String?
    
    enum CodingKeys: String, CodingKey {
        case uuid
        case symbol
        case name
        case iconUrl
        case price
        case listedAt
        case change
        case rank
        case marketCap
        case sparkline
        case volume24 = "24hVolume"
    }
}
