//
//  ViewController.swift
//  hangmanApp
//
//  Created by Matthew Ovie Enamuotor on 30/09/2023.
//

import UIKit

class ViewController: UIViewController {

    
   

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


   
    @IBAction func onScreen2Tapped(_ sender: UIButton) {
        
        performSegue(withIdentifier: "gotoScreen2", sender: self)
    }
}

