//
//  NewsViewModel.swift
//  GoogleNews
//
//  Created by iosdev on 11.02.2020.
//  Copyright © 2020 iosdev. All rights reserved.
//

import Foundation

final class NewsListViewViewModel {
  // MARK: - Properties.
  var title: String {
    Constants.newsTitle
  }
  private let service: NewsListServiceProtocol
  private let coordinator: NewsListCoordinator
  private var viewModels = [NewsListItemViewViewModel]()
  // MARK: - Initializer.
  init(with service: NewsListServiceProtocol, coordinator: NewsListCoordinator) {
    self.service = service
    self.coordinator = coordinator
  }
  // MARK: Data Source Methods
  /// Section Count
  func numberOfSections() -> Int{
    1
  }
  /// Rows Count In Section
  func numberOfRowsInSection(section: Int) -> Int {
    viewModels.count
  }
  /// ItemViewViewModel for IndexPath
  func itemViewViewModel(at indexPath: IndexPath) -> NewsListItemViewViewModel {
    viewModels[indexPath.item]
  }
  /// Fetch From API
  func fetch(completion: @escaping (Error?) -> Void) {
    guard let url = Constants.newsURL else { return }
    service.fetch(with: url, decodable: NewsListServiceResponse.self) { (result) in
      switch result{
      case .failure(let error):
        completion(error)
      case .success(let response):
        self.viewModels = response.list?.compactMap { NewsListItemViewViewModel(with: $0) } ?? []
        completion(nil)
      }
    }
  }
  /// Handle selected IndexPath
  func selected(at indexPath: IndexPath) {
    let viewModel = itemViewViewModel(at: indexPath)
    guard let url = viewModel.url else { return }
    showNewsDetail(for: url)
  }
  /// Show News Detail For Spesific URL
  func showNewsDetail(for url: URL) {
    coordinator.showNewsDetail(for: url)
  }
}
