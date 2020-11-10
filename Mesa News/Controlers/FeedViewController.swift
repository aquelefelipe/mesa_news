//
//  FeedViewController.swift
//  Mesa News
//
//  Created by Felipe Figueirôa on 08/11/20.
//

import UIKit

class FeedViewController: UIViewController {
    
    @IBOutlet weak var highlightsNewsCollection: UICollectionView!
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let MesaNews = News.getNews(token: getToken())
        print("MESA NEWS", MesaNews)
        
    }


}
