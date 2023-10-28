//
//  ViewController.swift
//  hangmanApp
//
//  Created by Matthew Ovie Enamuotor on 30/09/2023.
//

import UIKit

class ViewController: UIViewController {

    
   
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var startGameBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startGameBtn.isEnabled = false
        // Do any additional setup after loading the view.
    }


    @IBAction func onUsernameInput(_ sender: Any) {
        if usernameField.text != "" {
            startGameBtn.isEnabled = true
        }
    }
    
    @IBAction func onScreen2Tapped(_ sender: UIButton) {
        
        
        performSegue(withIdentifier: "gotoScreen2", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as! Screen2ViewController
        
        viewController.userMessage = "Let's Hang \(usernameField.text ?? "Let's Hang Someone")"
        
        //clear the username field
        usernameField.text = ""
        
        //set the startGameButton on screen2 to screen1 so we can disable it on return
        viewController.startGameButton = startGameBtn
    }
    
}

