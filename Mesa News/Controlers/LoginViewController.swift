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

        // Do any additional setup after loading the view.
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
