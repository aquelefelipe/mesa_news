//
//  Authentication.swift
//  Mesa News
//
//  Created by Felipe Figueirôa on 08/11/20.
//

import Foundation
import Alamofire

let baseURL = "https://mesa-news-api.herokuapp.com"
let token_key = "@TOKEN_KEY"
func setToken(token: String) {
    UserDefaults.standard.setValue(token, forKey: token_key)
}
func getToken() -> String {
    let token = UserDefaults.standard.object(forKey: token_key) as! String
    return token
}

func authenticateUser(email: String, password: String) {
    
//    let params: [String: [String]] = [
//        "email": ["\(email)"],
//        "password": ["\(password)"]
//    ]
//    let headers = ["Content-Type": "application/json"]
    
    print(email, password)
    
//    Alamofire.request("\(baseURL)/v1/client/auth/signin", method: .post, parameters: params, headers: headers).response {
//            response in debugPrint(response)
//    }
}

func signUpToNews(name: String, password: String, email: String) {
    print(email, name, password)
    let params: [String: String] = [
        "name": name,
        "email": email,
        "password": password,
    ]
    let headers = ["Content-Type": "application/json"]

    Alamofire.request("\(baseURL)/v1/client/auth/signup", method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers).responseJSON {
            response in
        }
    }
    
}
    

