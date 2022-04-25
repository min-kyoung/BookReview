//
//  BookReview.swift
//  BookReview
//
//  Created by 노민경 on 2022/04/25.
//

import Foundation

// UserDefaults에 저장될 값
struct BookReview: Codable {
    let title: String
    let contents: String
    let imageURL: URL?
}
