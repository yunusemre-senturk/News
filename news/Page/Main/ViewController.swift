//
//  ViewController.swift
//  news
//
//  Created by Yunus Emre Şentürk on 1.03.2024.
//

import UIKit
import Combine
class NewsCollectionView: UICollectionViewCell{
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var descLabel: UILabel!
    
}

class ViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    let reuseIdentifier = "cell"
    var viewModel = MainViewModel()
    let imageNames = ["image1", "image2", "image3", "image4", "image5", "image6", "image7", "image8","image1", "image2", "image3", "image4", "image5", "image6", "image7", "image8"]
    @IBOutlet weak var dolar: Exchange!
    @IBOutlet weak var euro: Exchange!
    @IBOutlet weak var gold: Exchange!
    @IBOutlet weak var bist: Exchange!
    private var cancellables = Set<AnyCancellable>()
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        viewModel.fetchNews()
        getExchange()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.news?.result?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! NewsCollectionView
        cell.descLabel.text = viewModel.news?.result?[indexPath.row].description ?? ""
        if let imageView = cell.image {
            imageView.image = UIImage(named: imageNames[indexPath.item])
        }
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Hücreye tıklama efekti ekleme
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.contentView.backgroundColor = UIColor.lightGray
        UIView.animate(withDuration: 0.2, animations: {
            cell?.contentView.backgroundColor = UIColor.white
            let detailStoryBoard = UIStoryboard(name: "Detail", bundle: nil)
            if let secondViewController = detailStoryBoard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
                secondViewController.webUrl = self.viewModel.news?.result?[indexPath.row].url ?? ""
                // Görünüm geçişini gerçekleştirin
                self.navigationController?.pushViewController(secondViewController, animated: true)
            }
            
        })
       
        
    }
    
    @IBAction func homePage(_ sender: Any) {
        print("Home Page")
    }
    @IBAction func bookmarks(_ sender: Any) {
        
    }
    @IBAction func notification(_ sender: Any) {
        
    }
    @IBAction func lastTime(_ sender: Any) {
        
    }
    
    func getExchange(){
        dolar.name.text = "Dolar"
        dolar.money.text = "34.1125"
        dolar.rateImage.image = UIImage(systemName: "arrowshape.up.fill")
        dolar.rateImage.tintColor = 5 > 1 ? .green : .blue
        euro.name.text = "Euro"
        euro.money.text = "40.1125"
        euro.rateImage.image = UIImage(systemName: "arrowshape.down.fill")
        euro.rateImage.tintColor = 5 > 10 ? .green : .red
        gold.name.text = "Altın"
        gold.money.text = "2012"
        gold.rateImage.image = UIImage(systemName: "arrowshape.down.fill")
        bist.name.text = "Borsa"
        bist.money.text = "8500"
        bist.rateImage.image = UIImage(systemName: "arrowshape.down.fill")
    }
}

