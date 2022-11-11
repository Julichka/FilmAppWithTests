//
//  JSONModel.swift
//  FilmsApp
//
//  Created by Kirill Timanovsky on 30.07.2021.
//

import Foundation
import AVKit

class JSONModel: Codable {
    var original_title: String?
    var poster_path: String?
    var release_date: String?
    var overview: String?
    var vote_average: Double?
    var backdrop_path: String?
}
