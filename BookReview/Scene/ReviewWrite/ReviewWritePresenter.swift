//
//  ReviewWritePresenter.swift
//  BookReview
//
//  Created by 노민경 on 2022/04/12.
//

import UIKit

protocol ReviewWriteProtocol {
    func setupNavigationBar()
    func setupViews()
    func showCloseAlertController()
    func saveAlertController()
    func presentToSearchBookViewController()
}

class ReviewWritePresenter {
    private let viewController: ReviewWriteProtocol
    
    init(viewController: ReviewWriteProtocol) {
        self.viewController = viewController
    }
    
    func viewDidLoad() {
        viewController.setupNavigationBar()
        viewController.setupViews()
    }
  
    func didTapLeftBarButton() {
        viewController.showCloseAlertController()
    }
    
    func didTapRightBarButton() {
        // TODO: UserDefaults에 사용자가 작성한 리뷰 저장하기
        viewController.saveAlertController()
    }
    
    func didTapBookTitleButton() {
        viewController.presentToSearchBookViewController()
    }
}
