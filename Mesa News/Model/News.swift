//
//  Highlight.swift
//  Mesa News
//
//  Created by Felipe Figueirôa on 09/11/20.
//

import Foundation
import UIKit
import Alamofire

class News {
    
    var title: String = ""
    var description: String = ""
    var content: String = ""
    var author: String = ""
    var published_at: String = ""
    var highlight: Bool = false
    var url: String = ""
    var image_url: String = ""
    
    init(title: String, description: String, content: String, author: String, published_at: String, highlight: Bool, url: String, image_url: String) {
        
        self.title = title
        self.description = description
        self.content = content
        self.author = author
        self.published_at = published_at
        self.highlight = highlight
        self.url = url
        self.image_url = image_url
    }
    
    static func getNews(token: String) {
        
        let headers = ["Content-Type": "application/json", "Authorization": "Bearer \(token)"]
        Alamofire.request("\(baseURL)/v1/client/news?current_page=&per_page=&published_at=", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON {
            response in
            
            guard response.result.isSuccess,
                  let value = response.result.value as? [String: Any] else {
                print("deu errado")
                return
            }
            
            print("VALUE", value["data"]!)
            
        }
        
    }
}

