//
//  BookSearchManager.swift
//  BookReview
//
//  Created by 노민경 on 2022/04/13.
//

// request 관련
import Alamofire
import Foundation

struct BookSearchManager {
    func request(from keyword: String, completionHandler: @escaping (([Book]) -> Void)) {
        guard let url = URL(string: "https://openapi.naver.com/v1/search/book.json") else { return }
        
        let secretKey = Bundle.main.apiKey
        let parameters = RequestModel(query: keyword)
        
        let headers: HTTPHeaders = [
            "X-Naver-Client-Id" : "HvEE3RORjaaN6iuT2iZv",
            "X-Naver-Client-Secret" : "\(secretKey)"
        ]
        
        AF
            .request(url, method: .get, parameters: parameters, headers: headers)
            // request로 받은 값을 decodable로 파싱
            .responseDecodable(of: ResponseModel.self) { response in
                switch response.result {
                case .success(let result):
                    completionHandler(result.items)
                case .failure(let error):
                    print(error)
                }
            }
            .resume()
    }
}
