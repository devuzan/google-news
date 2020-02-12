//
//  NewsListCollectionViewController.swift
//  GoogleNews
//
//  Created by iosdev on 11.02.2020.
//  Copyright © 2020 iosdev. All rights reserved.
//

import UIKit

final class NewsListViewController: UICollectionViewController {
  // MARK: - Properties
  private let viewModel: NewsListViewViewModel
  private let refreshControl = UIRefreshControl()
  // MARK: - Initializer
  init(with viewModel: NewsListViewViewModel, and layout: UICollectionViewLayout) {
    self.viewModel = viewModel
    super.init(collectionViewLayout: layout)
    viewSetup()
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  override func loadView() {
    super.loadView()
    fetchNews()
    setupLayout(with: view.bounds.size)
  }
  ///
  private func fetchNews(isRefreshing: Bool = false) {
    viewModel.fetch(completion: { [weak self] (hasError) in
      if let error = hasError{
        self?.showAlert(with: "Error", message: error.localizedDescription)
      }
      self?.reloadCollectionData()
      if isRefreshing {
        DispatchQueue.main.async { [weak self] in
          self?.refreshControl.endRefreshing()
        }
      }
    })
  }
  /// Refresh Data
  @objc
  private func refreshData() {
    fetchNews(isRefreshing: true)
  }
  // MARK: - View Setup & Layout
  /// View Setups.
  private func viewSetup() {
    title = viewModel.title
    collectionView.backgroundColor = .white
    collectionView.register(NewsListItemCollectionCell.self)
    collectionView.refreshControl = refreshControl
    refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
  }
  /// Reload Collection View
  private func reloadCollectionData() {
    DispatchQueue.main.async {
      self.collectionView.reloadData()
    }
  }
}
// MARK - CollectionView DataSource Methods.
extension NewsListViewController {
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    viewModel.numberOfSections()
  }
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    viewModel.numberOfRowsInSection(section: section)
  }
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsListItemCollectionCell.identifier, for: indexPath) as? NewsListItemCollectionCell else {
      return UICollectionViewCell()
    }
    let itemViewModel = viewModel.itemViewViewModel(at: indexPath)
    cell.configure(with: itemViewModel)
    return cell
  }
}
// MARK: - CollectionView Delegate Methods.
extension NewsListViewController {
  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    viewModel.selected(at: indexPath)
  }
}

// MARK: Flow Layout
extension NewsListViewController {
  private func setupLayout(with containerSize: CGSize) {
    guard let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
      return
    }
    flowLayout.minimumInteritemSpacing = 0
    flowLayout.minimumLineSpacing = Padding.small.cgFloat
    flowLayout.sectionInset = UIEdgeInsets(top: Padding.small.cgFloat, left: 0, bottom: Padding.small.cgFloat, right: 0)
    let width = traitCollection.horizontalSizeClass == .regular ? (containerSize.width / 2) - Padding.medium.cgFloat : containerSize.width - Padding.medium.cgFloat
    flowLayout.estimatedItemSize = CGSize(width: width, height: 0)
    reloadCollectionData()
  }
  override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
      super.viewWillTransition(to: size, with: coordinator)
      setupLayout(with: size)
  }
  override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
      super.traitCollectionDidChange(previousTraitCollection)
      setupLayout(with: view.bounds.size)
  }
}
