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
    do {
      let db = try Database(with: Constants.dbName)
      let table = try NewsTable(with: db, table: Constants.tableName)
      let viewModel = NewsListViewViewModel(with: service, coordinator: self, table: table)
      let layout = UICollectionViewFlowLayout()
      let viewController = NewsListViewController(with: viewModel, and: layout)
      navigationController.setViewControllers([viewController], animated: false)
    }catch let error {
      print(error.localizedDescription)
    }
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
