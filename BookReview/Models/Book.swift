//
//  Book.swift
//  BookReview
//
//  Created by 노민경 on 2022/04/13.
//

import Foundation

struct Book: Decodable {
    let title: String
    private let image: String?
    
    var imageURL: URL? { URL(string: image ?? "") }
}
