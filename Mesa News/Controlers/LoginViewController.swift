//
//  LoginViewController.swift
//  Mesa News
//
//  Created by Felipe Figueirôa on 08/11/20.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func doLogin(_ sender: Any) {
        authenticateUser(email: email.text!, password: password.text!, completion: {
            let token = getToken()
            if !token.isEmpty {
                self.performSegue(withIdentifier: "loginToFeed", sender: self)
            }
        })
    }
    
    @IBAction func goToSignUp(_ sender: Any) {
        performSegue(withIdentifier: "goToSignUp", sender:  self)
    }

}
