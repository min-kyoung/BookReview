//
//  RequestModel.swift
//  BookReview
//
//  Created by 노민경 on 2022/04/13.
//

import Foundation

struct RequestModel: Codable {
    /// 검색할 책 키워드
    let query: String
}
