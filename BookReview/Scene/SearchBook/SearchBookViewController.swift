//
//  SearchBookViewController.swift
//  BookReview
//
//  Created by 노민경 on 2022/04/13.
//

import UIKit
import SnapKit

class SearchBookViewController: UIViewController {
    private lazy var presenter = SearchBookPresenter(viewController: self)
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = presenter
        tableView.dataSource = presenter
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
}

extension SearchBookViewController: SearchBookProtocol {
    func setupViews() {
        view.backgroundColor = .systemBackground
        
        let searchController = UISearchController()
        searchController.obscuresBackgroundDuringPresentation = false // true일 경우, searchbar가 활성화 되있으면 검색 결과를 보여주는 부분의 배경이 어둡게 처리가 됨
        searchController.searchBar.delegate = presenter
        
        navigationItem.searchController = searchController
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
    
    func dismiss() {
        dismiss(animated: true)
    }
}
