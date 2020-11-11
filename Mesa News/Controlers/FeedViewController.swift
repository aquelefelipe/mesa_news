//
//  FeedViewController.swift
//  Mesa News
//
//  Created by Felipe Figueirôa on 08/11/20.
//

import UIKit

class FeedViewController: UIViewController, UICollectionViewDelegate {
    
    @IBOutlet weak var newsTableView: UITableView!
    
    var newsContent: [NewsModel] = []
    let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.newsTableView.isHidden = true
        
        News.getNews(token: getToken(), completion: { newsData in
            if let new = newsData {
                
                self.newsContent.append(contentsOf: new)
                self.newsTableView.reloadData()
                DispatchQueue.main.async{
                    self.activityIndicator.stopAnimating()
                    self.newsTableView.isHidden = false
                }
                
            }
        })
        
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)
        
    }
}

extension FeedViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let news = newsContent[indexPath.row]
        
        print("NEWS \(indexPath.row)", news)
        
        let cell = newsTableView.dequeueReusableCell(withIdentifier: "NewsCell") as! NewsTableViewCell
        
        let url = URL(string: news.imageURL)
        guard let data = try? Data(contentsOf: url!) else { return UITableViewCell()}
        
        cell.newsImageView.image = UIImage(data: data)
        cell.newsTitleLableView.text = news.title
        cell.newsDescriptionText.text = news.datumDescription
        
        return cell
        
    }
    
    
}

