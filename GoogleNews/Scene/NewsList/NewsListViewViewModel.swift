//
//  NewsViewModel.swift
//  GoogleNews
//
//  Created by iosdev on 11.02.2020.
//  Copyright © 2020 iosdev. All rights reserved.
//

import Foundation

final class NewsListViewViewModel: NewsListViewViewModelProtocol {
  // MARK: - Properties.
  var title: String {
    Constants.newsTitle
  }
  private let table: NewsTable
  private let service: NewsListServiceProtocol
  private let coordinator: NewsListCoordinator
  private var viewModels = [NewsListItemViewViewModel]()
  // MARK: - Initializer.
  init(with service: NewsListServiceProtocol, coordinator: NewsListCoordinator, table: NewsTable) {
    self.service = service
    self.coordinator = coordinator
    self.table = table
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
  /// Start Fetching...
  func fetch(completion: @escaping (Error?) -> Void) {
    fetchFromAPI { [weak self] (response, error) in
      if let apiError = error {
        completion(apiError)
      }else if let apiResponse = response {
        do {
          try self?.insertDB(from: apiResponse)
          self?.fetchFromDB(completionDB: { (presentationModel, error) in
            if let dbError = error {
              completion(dbError)
            }else if let models = presentationModel {
              self?.viewModels = models.compactMap { NewsListItemViewViewModel(with: $0) }
              completion(nil)
            }
          })
        } catch let insertError {
          completion(insertError)
        }
      }
    }
  }
  /// Fetch From API
  private func fetchFromAPI(completionAPI: @escaping (NewsListServiceResponse?, Error?) -> Void) {
    guard let url = Constants.newsURL else { return }
    service.fetch(with: url, responseObject: NewsListServiceResponse.self) { (result) in
      switch result{
      case .failure(let error):
        completionAPI(nil, error)
      case .success(let response):
        completionAPI(response, nil)
      }
    }
  }
  /// Fetch All Rows In Table
  private func fetchFromDB(completionDB: @escaping ([NewsListItemPresentationModel]?, Error?) -> Void) {
    do {
      let items = try table.fetch()
      completionDB(items, nil)
    } catch let error {
      completionDB(nil, error)
    }
  }
  /// Insert DB from Response
  private func insertDB(from response: NewsListServiceResponse) throws {
    try table.insert(response: response)
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
