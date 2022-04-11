//
//  SceneDelegate.swift
//  BookReview
//
//  Created by 노민경 on 2022/04/11.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScence = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScence)
        window?.backgroundColor = .systemBackground
        window?.rootViewController = UINavigationController(rootViewController: ReviewListViewController())
        window?.makeKeyAndVisible()
    }
}

