//
//  currencyViewController.swift
//  cambio
//
//  Created by Emir Can on 1.05.2023.
//

import UIKit

class currencyViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var priceLabel: UILabel!
    var kurCode: [String] = []
    var values: [Double] = []
    var aktifKur = 0.0
    var aktifKurTL = 0.0
    
    
    @objc func updateViews(sayi: Double){
        guard let degerText = amountTextField.text, var DEGERTEXT = Double(degerText) else { return }
        if amountTextField.text != "" {
            let total = aktifKur * DEGERTEXT
            priceLabel.text = String(format: "%2.f", total)
        }
    }
    
   
    @IBAction func alButton(_ sender: Any) {
       performSegue(withIdentifier: "toBackVC", sender: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchJSON()
        pickerView.delegate = self
        pickerView.dataSource = self
        amountTextField.addTarget(self, action: #selector(updateViews), for: .editingChanged)
        
    }
   
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return kurCode.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return kurCode[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       aktifKur = values[row]
            updateViews(sayi: aktifKur)
    }
    
    
    
    func fetchJSON(){
        guard let url = URL(string: "https://open.exchangerate-api.com/v6/latest") else { return  }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil{
                print(error!)
                return
            }
            guard let safeData = data else { return }
            do {
                let results = try JSONDecoder().decode(ExchangeRate.self, from: safeData)
                self.kurCode.append(contentsOf: results.rates.keys)
                self.values.append(contentsOf: results.rates.values)
                DispatchQueue.main.async {
                    self.pickerView.reloadAllComponents()
                }
            }catch{
                print(error)
            }
        }.resume()
        
    }
    
    
    func error(tit : String, mes : String) {
        let uyariMesaji =  UIAlertController(title: "Cambio'dan Mesaj", message: tit, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: mes, style: UIAlertAction.Style.default) { UIAlertAction in
        }
        uyariMesaji.addAction(okButton)
        self.present(uyariMesaji, animated: true, completion: nil)
    }
    
    
}






