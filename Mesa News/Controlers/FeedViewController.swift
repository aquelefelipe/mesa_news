//
//  FeedViewController.swift
//  Mesa News
//
//  Created by Felipe Figueirôa on 08/11/20.
//

import UIKit

class FeedViewController: UIViewController, UICollectionViewDelegate {
    
    @IBOutlet weak var highlightsNewsCollection: UICollectionView!
    
    var newsContent: [NewsModel] = []
    var cellScale: CGFloat = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        News.getNews(token: getToken(), completion: { newsData in
            if let new = newsData {
                print("NEWS", new[1].content)
                self.newsContent.append(contentsOf: new)
            }
        })
        
        let screenSize = UIScreen.main.bounds.size
        let cellWidth = floor(screenSize.width * cellScale) / 2
        let cellHeight = floor(screenSize.height * cellScale) / 2
        let instX = ( view.bounds.width - cellWidth ) / 2.0
        let instY = ( view.bounds.height - cellHeight ) / 2.0
        let layout = highlightsNewsCollection!.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        highlightsNewsCollection.contentInset = UIEdgeInsets(top: instY, left: instX, bottom: instY, right: instX)
        highlightsNewsCollection.dataSource = self
        highlightsNewsCollection.delegate = self
    }
}

extension FeedViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsContent.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "highlightCell", for: indexPath) as! HighlightsCollectionViewCell
        let news = newsContent[indexPath.item]
        cell.titleNews.text = news.title
        cell.authorNews.text = news.author
        cell.descriptionNews.text = news.datumDescription
        
        let url = URL(string: news.imageURL)
        let data = try? Data(contentsOf: url!)
        
        cell.imageNews.image = UIImage(data: data!)
        
        cell.layer.borderWidth = 1
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowRadius = 2.0
        cell.layer.cornerRadius = 10
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.shadowOffset = CGSize(width: 2.0, height: 4.0)
        cell.layer.shadowRadius = 2.0
        
        return cell
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let cell: HighlightsCollectionViewCell = Bundle.main.loadNibNamed("CollectioViewCell",
                                                                      owner: self,
                                                                      options: nil)?.first as? HighlightsCollectionViewCell else {
            return CGSize.zero
        }
//        cell.configureCell(name: names[indexPath.row])
        cell.setNeedsLayout()
        cell.layoutIfNeeded()
        let size: CGSize = cell.contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        return CGSize(width: size.width, height: 30)
    }
}
