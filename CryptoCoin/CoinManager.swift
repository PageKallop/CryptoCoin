//
//  CoinManager.swift
//  CryptoCoin
//
//  Created by Page Kallop on 12/14/20.
//

import Foundation


struct CoinManager {
    
    let coinPriceURL = "https://rest.coinapi.io/v1/exchangerate/BTC/"
    
    let apiKey = ""
    
    
    //Currency array
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    
    //Creates URL String that allows the input of selected currency
    func getCoinPrice(for currency: String){
        
        let urlString = "\(coinPriceURL)\(currency)\(apiKey)"
        print(urlString)
    }
    
    //Making api request
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, responce, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    self.parseJSON(coinData: safeData)
                }
            }
            task.resume()
        }
        
    }
    //Parse JSON to display certain parts of data 
    func parseJSON(coinData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: coinData)
            
            let lastPrice = decodedData.rate
            
            print(lastPrice)
        } catch {
            print(error)
            
        }
    }
}
