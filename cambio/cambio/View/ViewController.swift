//
//  ViewController.swift
//  cambio
//  Created by Emir Can on 28.04.2023.

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var parolaTekrarTextField: UITextField!
    @IBOutlet weak var kayitButtonNewOutlet: UIButton!
    @IBOutlet weak var parolaTekrarTextFieldOutlet: UITextField!
    @IBOutlet weak var parolaTekrarLabelOutlet: UILabel!
   
    @IBOutlet weak var kayitButtonOutlet: UIButton!
    @IBOutlet weak var girisButtonOutlet: UIButton!
    @IBOutlet weak var parolaLabel: UILabel!
    @IBOutlet weak var kullaniciIsimLabel: UILabel!
    @IBOutlet weak var girisText: UILabel!
    @IBOutlet weak var parolaTextField: UITextField!
    @IBOutlet weak var kullaniciTextField: UITextField!
    var kullaniciIsmiText = "emircantanyildiz"
    var sifreText = "benEmir1515"
    override func viewDidLoad() {
        super.viewDidLoad()
        kayitButtonOutlet.isHidden = true
        girisText.textColor = .white
        kullaniciIsimLabel.textColor = .white
        parolaLabel.textColor = .white
        parolaTekrarLabelOutlet.textColor = .white
        
        parolaTekrarTextFieldOutlet.isHidden = true
        parolaTekrarLabelOutlet.isHidden = true
        kayitButtonNewOutlet.isHidden = true
    }
    func error(tit : String, mes : String) {
        let uyariMesaji =  UIAlertController(title: "Cambio'dan Mesaj", message: tit, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: mes, style: UIAlertAction.Style.default) { UIAlertAction in
        }        
        uyariMesaji.addAction(okButton)
        self.present(uyariMesaji, animated: true, completion: nil)
    }
    func girisYap() {
        performSegue(withIdentifier: "toGirisVC", sender:  nil)
    }
    @IBAction func girisYapButton(_ sender: Any) {
        if kullaniciTextField.text == kullaniciIsmiText && parolaTextField.text == sifreText{
            print("Giriş Başarılı")
            girisYap()
        }
        else{
            error(tit: "Kullanici Ismi: emircantanyildiz\nŞifre: benEmir1515", mes: "Tamamdır 👍")
        }
    }
    func kayitOl() {
        parolaTekrarTextFieldOutlet.isHidden = false
        parolaTekrarLabelOutlet.isHidden = false
        girisButtonOutlet.isHidden = true
        kayitButtonOutlet.isHidden=true
        kayitButtonNewOutlet.isHidden=false
    }
    @IBAction func kayitButton(_ sender: Any) {
        kayitOl()
        if parolaTextField.text == parolaTekrarTextField.text && parolaTextField.text != ""{
            print("Kayıt Başarılı")
            kullaniciIsmiText = kullaniciIsimLabel.text!
            sifreText = parolaTekrarTextField.text!
            error(tit: "Kayıt Başarılı", mes: "Tamamdır 👍")
            parolaTekrarTextFieldOutlet.isHidden = true
            parolaTekrarLabelOutlet.isHidden = true
            girisButtonOutlet.isHidden = false
            kayitButtonOutlet.isHidden=false
            kayitButtonNewOutlet.isHidden=true
        }
        else{
            error(tit: "Paroların Uyuşmuyor", mes: "Düzeltiyorum 👍")
        }
    }
    @IBAction func kayitButtonNew(_ sender: Any) {
        kayitOl()
        if parolaTextField.text == parolaTekrarTextField.text{
            print("Kayıt Başarılı")
            kullaniciIsmiText = kullaniciIsimLabel.text!
            sifreText = parolaTekrarTextField.text!
            error(tit: "Kayıt Başarılı", mes: "Tamamdır 👍")
            parolaTekrarTextFieldOutlet.isHidden = true
            parolaTekrarLabelOutlet.isHidden = true
            girisButtonOutlet.isHidden = false
            kayitButtonOutlet.isHidden=false
            kayitButtonNewOutlet.isHidden=true
        }
        else{
            error(tit: "Paroların Uyuşmuyor", mes: "Düzeltiyorum 👍")
        }
    }
    
    
}

