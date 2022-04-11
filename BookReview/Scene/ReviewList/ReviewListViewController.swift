//
//  ReviewListViewController.swift
//  BookReview
//
//  Created by 노민경 on 2022/04/11.
//

import SnapKit
import UIKit

class ReviewListViewController: UIViewController {
    // Presenter 호출해서 user action을 알려줘야 함 => user action을 알려줄 presenter의 property 생성
    private lazy var presenter = ReviewListPresenter(viewController: self)
 
    private lazy var tableView: UITableView = {
        let tabelView = UITableView()
        tabelView.dataSource = presenter
        
        return tabelView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
}

// viewController가 ReviewListProtocol을 따르도록 함
extension ReviewListViewController: ReviewListProtocol {
    func setupNavigationBar() {
        navigationItem.title = "도서 리뷰"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: nil
        )
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    func setupViews() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}


