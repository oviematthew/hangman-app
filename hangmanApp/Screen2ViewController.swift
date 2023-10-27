//
//  Screen2ViewController.swift
//  hangmanApp
//
//  Created by Matthew Ovie Enamuotor on 27/10/2023.
//

import UIKit

class Screen2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

   
    @IBAction func onExitBtnTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
