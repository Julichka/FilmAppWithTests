//
//  FilmsAppTests.swift
//  FilmsAppTests
//
//  Created by Igor Khrupin on 11/10/22.
//

import XCTest
@testable import FilmsApp

final class FilmsAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testAddFavorites() throws {
        let model = Model()
        
        var likedItemsBefore = model.shoLikedItems()
        XCTAssertEqual(likedItemsBefore.count, 0)
        
        model.addToFavorites(id: 0)
        
        likedItemsBefore = model.shoLikedItems()
        XCTAssertEqual(likedItemsBefore.count, 1)
    }
    
    func testRemoveFavorites() throws {
        let model = Model()
        model.addToFavorites(id: 0)
        
        var likedItemsBefore = model.shoLikedItems()
        XCTAssertEqual(likedItemsBefore.count, 1)
        
        model.removeFromFavorites(id: 0)
        
        likedItemsBefore = model.shoLikedItems()
        XCTAssertEqual(likedItemsBefore.count, 0)
    }

}
