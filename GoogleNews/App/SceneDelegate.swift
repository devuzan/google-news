//
//  SceneDelegate.swift
//  GoogleNews
//
//  Created by iosdev on 11.02.2020.
//  Copyright © 2020 iosdev. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  // MARK: Public Properties.
  var window: UIWindow?
  let navigationController = UINavigationController()
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    window = UIWindow()
    let coordinator = NewsListCoordinator(with: navigationController)
    coordinator.start()
    window?.rootViewController = coordinator.navigationController
    window?.makeKeyAndVisible()
    window?.windowScene = windowScene
  }
}

