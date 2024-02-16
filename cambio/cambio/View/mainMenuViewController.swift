//
//  mainMenuViewController.swift
//  cambio
//
//  Created by Emir Can on 30.04.2023.
//

import UIKit

class mainMenuViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func profileButton(_ sender: Any) {
        performSegue(withIdentifier: "toMenuVC", sender: nil)
    }
    @IBAction func hesabimButton(_ sender: Any) {
        performSegue(withIdentifier: "toMenuVC", sender: nil)
        
    }
    @IBAction func haberlerButton(_ sender: Any) {
        performSegue(withIdentifier: "toHaberlerVC", sender: nil)
        
    }
    @IBAction func alSatButton(_ sender: Any) {
        performSegue(withIdentifier: "toKurAlSatVC", sender: nil)
        
    }
    

   

}
