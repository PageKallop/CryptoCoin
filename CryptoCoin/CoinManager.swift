//
//  CoinManager.swift
//  CryptoCoin
//
//  Created by Page Kallop on 12/14/20.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdateCurrency(currencyInfo: CoinModel)
}


struct CoinManager {
    
    var delegate: CoinManagerDelegate?
    
    let coinPriceURL = "https://rest.coinapi.io/v1/exchangerate/BTC/"
    
    let apiKey = ""
    
    
    //Currency array
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    
    //Creates URL String that allows the input of selected currency
    func getCoinPrice(for currency: String){
       
        let urlString = "\(coinPriceURL)\(currency)\(apiKey)"
        print(urlString)
  
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, responce, error) in
                if error != nil {
                print(error!)
                return
            }
                if let safeData = data {
                    if let currencyInfo = self.parseJSON(coinData: safeData) {
                        self.delegate?.didUpdateCurrency(currencyInfo: currencyInfo)
                    }
                }
            }
            task.resume()
        }
        
    }
        func parseJSON(coinData: Data) -> CoinModel? {
            let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode(CoinData.self, from: coinData)
                let coinPrice = decodedData.rate
                let currencyName = decodedData.asset_id_quote
                
                let currencyInfo = CoinModel(coinPrice: coinPrice, currencyType: currencyName)
                print(currencyInfo.coinPrice)
                return currencyInfo
                
            } catch {
                print(error)
                return nil
            }
        }

   
}

