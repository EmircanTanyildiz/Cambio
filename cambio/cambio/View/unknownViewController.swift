//
//  unKnownViewController.swift
//  cambio
//
//  Created by Emir Can on 28.04.2023.
//

import UIKit

class unknownViewController: UIViewController {
   
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var imageViewIki: UIImageView!
    @IBOutlet weak var girisImageView: UIImageView!
    @IBOutlet weak var girisLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        girisText(mesaj: "Merhaba Emir Hoşgeldin")
        label2.text=""
        imageViewIki.isHidden = true
    }
    
    func girisText(mesaj:String){
        girisLabel.text = mesaj
    }
    
    var sayac = 0
    @IBAction func devamButton(_ sender: Any) {
        sayac = sayac+1
        switch sayac {
        case 1:
            girisImageView.isHidden = true
            girisLabel.text = ""
            imageViewIki.isHidden = false
            label2.text = "Artık Cambio İle Kur bilgilerini takip etmeye Hazırsın"
        case 2:
            performSegue(withIdentifier: "toMenuVC", sender: nil)
        default:
            print("diğer")
        }
    }
    

}
