//
//  ViewController.swift
//  CryptoCoin
//
//  Created by Page Kallop on 12/14/20.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

  // creates coinManager object
    var coinManager = CoinManager()

   
    @IBOutlet weak var coinLabel: UILabel!
    
    @IBOutlet weak var currencyLabel: UILabel!
    
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Allows th picker to be updated by vc
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
    }

  
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       
        return coinManager.currencyArray.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let currency = coinManager.currencyArray[row]
        coinManager.getCoinPrice(for: currency)
        
        currencyLabel.text = coinManager.currencyArray[row] 
    }

}

