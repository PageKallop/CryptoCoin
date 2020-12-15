//
//  CoinModel.swift
//  CryptoCoin
//
//  Created by Page Kallop on 12/15/20.
//

import Foundation


// holds coin data
struct CoinModel {
    
    let coinPrice: Double
    let currencyType: String
    
    var currencyPriceString: String {
        return String(format: "%.1f", coinPrice)
    }
}
