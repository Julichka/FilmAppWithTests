//
//  FavoriteFilmsViewController.swift
//  FilmsApp
//
//  Created by Kirill Timanovsky on 29.07.2021.
//

import UIKit

class FavoriteFilmsViewController: UIViewController {
    
    
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    let transition: RoundingTransition = RoundingTransition()
    var testArray = DataLake.model.shoLikedItems()
    var searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainCollectionView.dataSource = self
        mainCollectionView.delegate = self
        
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Find Your Film"
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        let xibCell = UINib(nibName: "FavoriteFilmCollectionViewCell", bundle: nil)
        
        mainCollectionView.register(xibCell, forCellWithReuseIdentifier: "FavoriteFilmCell")
        
        mainCollectionView.reloadData()
    }

}

extension FavoriteFilmsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteFilmCell", for: indexPath) as? FilmCollectionViewCell else {
           return UICollectionViewCell()
       }
 
        cell.posterPreviewImageView.image = UIImage(named: testArray[indexPath.row].testPic ?? "image1")
        cell.filmTitleLabel.text = testArray[indexPath.row].testTitle
        cell.releaseYearLabel.text = testArray[indexPath.row].testYear
        cell.ratingLabel.text = String(testArray[indexPath.row].testRating)
        
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

