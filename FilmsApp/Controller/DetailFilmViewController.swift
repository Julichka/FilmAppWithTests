//
//  DetailFilmViewController.swift
//  FilmsApp
//
//  Created by Kirill Timanovsky on 29.07.2021.
//

import UIKit

class DetailFilmViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var filmTitleLabel: UILabel!
    
    @IBOutlet weak var releaseYearLabel: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var galleryCollection: UICollectionView!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet var tapGesture: UITapGestureRecognizer!
    
    @IBOutlet weak var bFavoritesToggle: UIButton!
    var receivedIndex: Int = Int()
    
    var transition: RoundingTransition = RoundingTransition()
    
    var model = DataLake.model
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var item = model.items()[receivedIndex]
        
        posterImageView.image = UIImage(named: item.testPic ?? "image1")
        filmTitleLabel.text = item.testTitle
        releaseYearLabel.text = item.testYear
        ratingLabel.text = String(item.testRating)
        updateFavoritesButton()
    }
    
    func updateFavoritesButton() {
        var item = model.items()[receivedIndex]
        if (item.isLiked) {
            bFavoritesToggle.setTitle("Remove from Favorites", for: .normal)
        } else {
            bFavoritesToggle.setTitle("Add to Favorites", for: .normal)
        }
    }
    
    @IBAction func onFavoritesClick(_ sender: Any) {
        var item = model.items()[receivedIndex]
        if (item.isLiked) {
            model.removeFromFavorites(id: item.id)
        } else {
            model.addToFavorites(id: item.id)
        }
        updateFavoritesButton()
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionProfile = .show
        transition.start = posterImageView.center
        transition.roundColor = UIColor.lightGray
        
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionProfile = .cancel
        transition.start = posterImageView.center
        transition.roundColor = UIColor.lightGray
        
        return transition
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destVC = segue.destination as? PosterFullViewController else {
            return
        }
        
        destVC.detailIndexPath = receivedIndex
        
        destVC.transitioningDelegate = self
        destVC.modalPresentationStyle = .custom
    }
    
    
    @IBAction func tapGestureAction(_ sender: UITapGestureRecognizer) {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
