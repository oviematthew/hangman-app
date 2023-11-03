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

    
        //on edit changed of username input
    @IBAction func onUsernameInput(_ sender: Any) {
       
        //do not enable button if there is no text in the field
        if !(usernameField.hasText) {
            startGameBtn.isEnabled = false
        }
        else {
            startGameBtn.isEnabled = true
        }
    }
    
    //on click of start game button
    @IBAction func onScreen2Tapped(_ sender: UIButton) {
        
        if usernameField.hasText{
            performSegue(withIdentifier: "gotoScreen2", sender: self)
        }
        
        
    }
    
    //passing value to second screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as! Screen2ViewController
            
        //username
        viewController.user = "\(usernameField.text ?? "User")"

        //usermessage
        viewController.userMessage = "Let's hang \(viewController.user ?? "Let's hang someone")"
        
        
        
        //clear the username field
        usernameField.text = ""
        
        //disable the button
        startGameBtn.isEnabled = false
        
        
    }
   

    
}

