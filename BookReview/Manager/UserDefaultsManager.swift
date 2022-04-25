//
//  UserDefaultsManager.swift
//  BookReview
//
//  Created by 노민경 on 2022/04/25.
//

import Foundation

protocol UserDefaultsManagerProtocol {
    func getReviews() -> [BookReview]
    func setReviews(_ newValue: BookReview)
}

// 테스트를 작성하기 위해 프로토콜을 struct가 따르도록 함
struct UserDefaultsManager: UserDefaultsManagerProtocol {
    enum Key: String {
        case review
    }
    
    func getReviews() -> [BookReview] {
        guard let data = UserDefaults.standard.data(forKey: Key.review.rawValue) else { return [] }
        
        return (try? PropertyListDecoder().decode([BookReview].self, from: data)) ?? [] // UserDefaults에 저장된 리뷰를 가져옴
    }
    
    func setReviews(_ newValue: BookReview) {
        var currentReviews: [BookReview] = getReviews()
        currentReviews.insert(newValue, at: 0) // 0번째에 최신으로 작성한 리뷰를 넣음
        
        UserDefaults.standard.setValue(try? PropertyListEncoder().encode(currentReviews), forKey: Key.review.rawValue) // UserDefaults에 리뷰 저장
    }
    
    
}
