//
//  ViewController.swift
//  FilmsApp
//
//  Created by Kirill Timanovsky on 29.07.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    
    let transition: RoundingTransition = RoundingTransition()
    var model = DataLake.model
    
    var searchController = UISearchController()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        mainCollectionView.dataSource = self
        mainCollectionView.delegate = self
        
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Find Your Film"
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        
        let sortBtn = UIBarButtonItem(
            title: "sort",
            style: .plain,
            target: self,
            action: #selector(sort(sender:))
        )
        
        let favotitesBtn = UIBarButtonItem(
            title: "favorite",
            style: .plain,
            target: self,
            action: #selector(openFavorites(sender:))
        )
        
        navigationItem.rightBarButtonItems = [sortBtn, favotitesBtn]
        
        
        let xibCell = UINib(nibName: "CustomFilmCollectionViewCell", bundle: nil)
        mainCollectionView.register(xibCell, forCellWithReuseIdentifier: "CustomFilmCell")
        mainCollectionView.reloadData()
    }
    
    @objc func openFavorites(sender: UIBarButtonItem) {
        guard let favoritesScreen = storyboard?.instantiateViewController(withIdentifier: "FavoritesScreen") as? FavoriteFilmsViewController else {
            return
        }
        
        navigationController?.pushViewController(favoritesScreen, animated: true)
    }
    
    @objc func sort(sender: UIBarButtonItem) {
        model.ratingSort()
        mainCollectionView.reloadData()
    }
    
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.items().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: "CustomFilmCell", for: indexPath) as? FilmCollectionViewCell else {
           return UICollectionViewCell()
       }
        
        let items = model.items()
 
        cell.posterPreviewImageView.image = UIImage(named: items[indexPath.row].testPic ?? "image1")
        cell.filmTitleLabel.text = items[indexPath.row].testTitle
        cell.releaseYearLabel.text = items[indexPath.row].testYear
        cell.ratingLabel.text = String(items[indexPath.row].testRating)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let destViewController = storyboard?.instantiateViewController(withIdentifier: "DetailFilmViewControllerS") as? DetailFilmViewController else {
            return
        }
        
        destViewController.receivedIndex = indexPath.row
        
        navigationController?.pushViewController(destViewController, animated: true)

    }
    
    
}
