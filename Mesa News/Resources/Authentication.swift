//
//  Authentication.swift
//  Mesa News
//
//  Created by Felipe Figueirôa on 08/11/20.
//

import Foundation
import Alamofire
import UIKit

let baseURL = "https://mesa-news-api.herokuapp.com"
let token_key = "@TOKEN_KEY"
func setToken(token: String) {
    UserDefaults.standard.setValue(token, forKey: token_key)
}
func getToken() -> String {
    let token = UserDefaults.standard.object(forKey: token_key) as! String
    return token
}

struct AuthenticationToken: Codable {
    let token: String
}

func authenticateUser(email: String, password: String, completion: @escaping () -> Void) {
    
    let params: [String: String] = [
        "email": email,
        "password": password
    ]
    let headers = ["Content-Type": "application/json"]
    
    print(email, password)
    
    Alamofire.request("\(baseURL)/v1/client/auth/signin", method: .post, parameters: params,encoding: JSONEncoding.default, headers: headers).responseJSON {
        response in
        guard response.result.isSuccess else {
            print("Deu errado")
            return
        }
        
        guard let data = response.data else { return }
        do {
            let decoder = JSONDecoder()
            let token = try decoder.decode(AuthenticationToken.self, from: data)
            print("TOKEN", token.token)
            setToken(token: token.token)
            completion()
        } catch let error {
            print("Deu errado no parse do JSON: \(error)")
            completion()
        }
    }
   
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
        guard response.result.isSuccess,
              let value = response.result.value as? [String: String] else {
                    print(response.result)
                    return
                }
                setToken(token: value["token"]!)
        }
    
}
    
    

