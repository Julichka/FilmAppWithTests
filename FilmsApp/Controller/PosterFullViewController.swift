//
//  PosterFullViewController.swift
//  FilmsApp
//
//  Created by Kirill Kraynov on 8/22/21.
//

import UIKit

class PosterFullViewController: UIViewController {
    
    @IBOutlet weak var fullPosterImageView: UIImageView!
    
    @IBOutlet weak var closeButton: UIButton!
    
    var detailIndexPath: Int = Int()
    
    
    @IBAction func closeButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var model = DataLake.model
        
        fullPosterImageView.image = UIImage(named: model.items()[detailIndexPath].testPic ?? "image1")

        // Do any additional setup after loading the view.
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
