//
//  ReviewListViewController.swift
//  BookReview
//
//  Created by 노민경 on 2022/04/11.
//

import SnapKit
import UIKit

class ReviewListViewController: UIViewController, UITextViewDelegate {
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
    
    // 화면이 가려졌다가 새로 보여지면 새로 데이터를 가져와서 테이블 뷰를 그리도록 함
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.viewWillAppear()
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
            action: #selector(didTapRightBarButtonItem)
        )
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    func setupViews() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func presentToReviewWriteViewController() {
        let vc = UINavigationController(rootViewController: ReviewWriteViewController())
        vc.modalPresentationStyle = .fullScreen
        
        present(vc, animated: true)
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
}

private extension ReviewListViewController {
    @objc func didTapRightBarButtonItem() {
        presenter.didTapRightBarButtonItem()
    }
}


