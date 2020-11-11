//
//  SignUpViewController.swift
//  Mesa News
//
//  Created by Felipe Figueirôa on 08/11/20.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func doSignUp(_ sender: Any) {
        if password.text != confirmPassword.text {
            let alert = UIAlertController(title: "Error", message: "The passwords are differents", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            signUpToNews(name: name.text!, password: password.text!, email: email.text!)
        }
        
    }
    
    @IBAction func cancelSignUp(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
