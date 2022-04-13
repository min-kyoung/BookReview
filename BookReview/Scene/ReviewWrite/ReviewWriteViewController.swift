//
//  ReviewWriteViewController.swift
//  BookReview
//
//  Created by 노민경 on 2022/04/12.
//

import UIKit
import SnapKit

class ReviewWriteViewController: UIViewController {
    private lazy var presenter = ReviewWritePresenter(viewController: self)
    
    private lazy var bookTitleButton: UIButton = {
        let button = UIButton()
        button.setTitle("책 제목", for: .normal)
        button.setTitleColor(.tertiaryLabel, for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = .systemFont(ofSize: 23.0, weight: .bold)
        
        button.addTarget(self, action: #selector(didTapBookTitleButton), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var contentsTextView: UITextView = {
        let textView = UITextView()
        // placaholder
        textView.text = "내용을 입력해주세요."
        textView.textColor = .tertiaryLabel
        textView.font = .systemFont(ofSize: 16.0, weight: .medium)
        
        // placeholder 제거
        textView.delegate = self
        
        return textView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .secondarySystemBackground
        
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
 
}

extension ReviewWriteViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard textView.textColor == .tertiaryLabel else {
            return
        }
        textView.text = nil
        textView.textColor = .label
    }
}

extension ReviewWriteViewController: ReviewWriteProtocol {
    func setupNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .close,
            target: self,
            action: #selector(didTapLeftBarButton)
        )
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .save,
            target: self,
            action: #selector(didTapRightBarButton)
        )
    }
    
    func showCloseAlertController() {
        let alertController = UIAlertController(
            title: "정말 닫으시겠습니까?",
            message: nil,
            preferredStyle: .alert
        )
        
        let closeAction = UIAlertAction(
            title: "닫기",
            style: .destructive
        ) { [weak self] _ in
            self?.dismiss(animated: true)
        }
        
        let cancelAction = UIAlertAction(
            title: "취소",
            style: .cancel
        )
        
        [ closeAction, cancelAction].forEach {
            alertController.addAction($0) }
        
        present(alertController, animated: true)
    }
    
    func saveAlertController() {
       dismiss(animated: true)
    }
    
    func setupViews() {
        view.backgroundColor = .systemBackground
        
        [ bookTitleButton, contentsTextView, imageView].forEach {
            view.addSubview($0) }
        
        bookTitleButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20.0)
            $0.trailing.equalToSuperview().inset(20.0)
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(20.0)
        }
        
        contentsTextView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16.0)
            $0.trailing.equalToSuperview().inset(16.0)
            $0.top.equalTo(bookTitleButton.snp.bottom).offset(16.0)
        }
        
        imageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20.0)
            $0.trailing.equalToSuperview().inset(20.0)
            $0.top.equalTo(contentsTextView.snp.bottom).offset(16.0)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            
            $0.height.equalTo(200.0)
        }
    }
    
    func presentToSearchBookViewController() {
        let vc = UINavigationController(rootViewController: SearchBookViewController())
        
        present(vc, animated: true)
    }
}

private extension ReviewWriteViewController {
    @objc func didTapLeftBarButton() {
        presenter.didTapLeftBarButton()
    }
    
    @objc func didTapRightBarButton() {
        presenter.didTapRightBarButton()
    }
    
    @objc func didTapBookTitleButton() {
        presenter.didTapBookTitleButton()
    }
}
