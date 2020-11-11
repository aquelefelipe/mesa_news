//
//  HighlightsCollectionViewCell.swift
//  Mesa News
//
//  Created by Felipe Figueirôa on 09/11/20.
//

import UIKit

class HighlightsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageNews: UIImageView!
    @IBOutlet weak var titleNews: UILabel!
    @IBOutlet weak var authorNews: UILabel!
    @IBOutlet weak var descriptionNews: UITextView!
    
    var news: NewsModel! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI() {
        if let news = news {
            
            let url = URL(string: news.imageURL)
            let data = try? Data(contentsOf: url!)
            
            imageNews.image = UIImage(data: data!)
            titleNews.text = news.title
            authorNews.text = news.author
            descriptionNews.text = news.datumDescription
        } else {
            imageNews.image = nil
            titleNews.text = nil
            authorNews.text = nil
            descriptionNews.text = nil
        }
        
        imageNews.layer.cornerRadius = 10.0
        imageNews.layer.masksToBounds = true
    }
    
}
