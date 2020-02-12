//
//  NewsCoordinator.swift
//  GoogleNews
//
//  Created by iosdev on 11.02.2020.
//  Copyright © 2020 iosdev. All rights reserved.
//

import UIKit
import SafariServices

final class NewsListCoordinator: Coordinator {
  var navigationController: UINavigationController
  // MARK: - Initializer
  init(with navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  // MARK: - Coordinator Protocol
  func start() {
    let service = NewsListService()
    let viewModel = NewsListViewViewModel(with: service, coordinator: self)
    let layout = UICollectionViewFlowLayout()
    let viewController = NewsListViewController(with: viewModel, and: layout)
    navigationController.setViewControllers([viewController], animated: false)
  }
  /// Show News Detail for URL
  func showNewsDetail(for url: URL) {
    let config = SFSafariViewController.Configuration()
    let viewController = SFSafariViewController(url: url, configuration: config)
    let safariNavigationController = UINavigationController(rootViewController: viewController)
    safariNavigationController.setNavigationBarHidden(true, animated: false)
    safariNavigationController.modalPresentationStyle = .fullScreen
    navigationController.present(safariNavigationController, animated: true, completion: nil)
  }
}
