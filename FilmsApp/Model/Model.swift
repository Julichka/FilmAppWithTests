//
//  Model.swift
//  FilmsApp
//
//  Created by Igor Khrupin on 9/24/22.
//

import Foundation

struct DataLake {
    @available(*, unavailable) private init() {}
    
    static var model: Model = Model()    
}

class Model {
    
    func shoLikedItems() -> [Item] {
        var likedItems: [Item] = []
        for i in testArray {
            if i.isLiked == true {
                likedItems.append(i)
            }
        }
        return likedItems
    }
    
    func ratingSort() {
        self.testArray.sort{
            $0.testRating ?? 0 > $1.testRating ?? 0
        }
        self.newItems = testArray
    }
    
    func removeFromFavorites(id: Int?) {
        for i in testArray {
            if i.id == id {
                i.isLiked = false
            }
        }
        self.newItems = testArray
    }
    
    func addToFavorites(id: Int?) {
        for i in testArray {
            if i.id == id {
                i.isLiked = true
            }
        }
        self.newItems = testArray
    }
    
    func items() -> [Item] {
        return newItems
    }
    
    init() {
        self.newItems = testArray
    }
    
    private var testArray: [Item] = [
                                
        Item(id: 0, testPic: "image1", testTitle: "Фильм 1", testYear: "2001", testRating: 4, isLiked: false),
        
        Item(id: 1, testPic: "image2", testTitle: "Фильм 2", testYear: "2003", testRating: 4, isLiked: false),
        
        Item(id: 2, testPic: "image3", testTitle: "Фильм 3", testYear: "2013", testRating: 4, isLiked: false),
        
        Item(id: 3, testPic: "image4", testTitle: "Фильм 4", testYear: "2015", testRating: 4, isLiked: false),
        
        Item(id: 4, testPic: "image5", testTitle: "Фильм 5", testYear: "2016", testRating: 9, isLiked: false),
        
        Item(id: 5, testPic: "image6", testTitle: "Фильм 6", testYear: "2017", testRating: 4, isLiked: false),
        
        Item(id: 6, testPic: "image7", testTitle: "Фильм 7", testYear: "2021", testRating: 6, isLiked: false),
        
        Item(id: 7, testPic: "image8", testTitle: "Фильм 8", testYear: "2004", testRating: 5, isLiked: false),
        
        Item(id: 8, testPic: "image9", testTitle: "Фильм 9", testYear: "2005", testRating: 1, isLiked: false),
        
        Item(id: 9, testPic: "image10", testTitle: "Фильм 10", testYear: "2008", testRating: 5, isLiked: false),
        
        Item(id: 10, testPic: "image11", testTitle: "Фильм 11", testYear: "2000", testRating: 4, isLiked: false),
        
        Item(id: 11, testPic: "image12", testTitle: "Фильм 12", testYear: "2009", testRating: 4, isLiked: false),
        
        Item(id: 12, testPic: "image13", testTitle: "Фильм 13", testYear: "2007", testRating: 1, isLiked: false),
        
        Item(id: 13, testPic: "image14", testTitle: "Фильм 14", testYear: "2001", testRating: 8, isLiked: false),
        
        Item(id: 14, testPic: "image15", testTitle: "Фильм 15", testYear: "2004", testRating: 7, isLiked: false)
    ]
    
    var newItems: [Item] = []
}

class Item {
    var id: Int?
    var testPic: String?
    var testTitle: String?
    var testYear: String?
    var testRating: Int = 0
    var isLiked: Bool
    
    init(id: Int?, testPic: String?, testTitle: String?, testYear: String?, testRating: Int, isLiked: Bool) {
        self.id = id
        self.testPic = testPic
        self.testTitle = testTitle
        self.testYear = testYear
        self.testRating = testRating
        self.isLiked = isLiked
    }
}
