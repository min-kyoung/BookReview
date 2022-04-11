//
//  ReviewListPresenter.swift
//  BookReview
//
//  Created by 노민경 on 2022/04/11.
//

import UIKit

// ViewController에서 받은 동작에 의해서 모델을 업데이트할 경우 다시 ViewController로 알려줘야 함 => iewController에게 알리기 위한 방법으로 delegate 패턴을 사용
protocol ReviewListProtocol {
    func setupNavigationBar()
    func setupViews()
}

class ReviewListPresenter: NSObject {
    // ReviewListProtocol은 Presenter에서 사용하는 것이기 때문에 Presenter가 Protocol의 property를 갖게 됨
    private let viewController: ReviewListProtocol
    
    init(viewController: ReviewListProtocol) {
        self.viewController = viewController
        
    }
    
    func viewDidLoad() {
        viewController.setupNavigationBar()
        viewController.setupViews()
    }
}

extension ReviewListPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(
            style: .subtitle,
            reuseIdentifier: nil
        )
        cell.textLabel?.text = "\(indexPath)"
        
        return cell
    }
    
    
}
