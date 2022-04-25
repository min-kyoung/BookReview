//
//  ReviewListPresenter.swift
//  BookReview
//
//  Created by 노민경 on 2022/04/11.
//

import Kingfisher
import UIKit

// ViewController에서 받은 동작에 의해서 모델을 업데이트할 경우 다시 ViewController로 알려줘야 함 => iewController에게 알리기 위한 방법으로 delegate 패턴을 사용
protocol ReviewListProtocol {
    func setupNavigationBar()
    func setupViews()
    func presentToReviewWriteViewController()
    func reloadTableView()
}

class ReviewListPresenter: NSObject {
    // ReviewListProtocol은 Presenter에서 사용하는 것이기 때문에 Presenter가 Protocol의 property를 갖게 됨
    private let viewController: ReviewListProtocol
    private let userDefaultsManager = UserDefaultsManager()
    
    private var review: [BookReview] = []
    
    init(viewController: ReviewListProtocol) {
        self.viewController = viewController
        
    }
    
    func viewDidLoad() {
        viewController.setupNavigationBar()
        viewController.setupViews()
    }
    
    func viewWillAppear() {
        // TODO: UserDefaults 내용 업데이트 하기
        review = userDefaultsManager.getReviews() // viewWillAppear기 되면 review는 값을 가져옴
        
        viewController.reloadTableView()
    }
    
    func didTapRightBarButtonItem() {
        viewController.presentToReviewWriteViewController()
    }
}

extension ReviewListPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        review.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(
            style: .subtitle,
            reuseIdentifier: nil
        )
        let review = review[indexPath.row]
        cell.textLabel?.text = review.title
        cell.detailTextLabel?.text = review.contents
        cell.imageView?.kf.setImage(with: review.imageURL)
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    
}
