//
//  NewsListItemCell.swift
//  GoogleNews
//
//  Created by iosdev on 12.02.2020.
//  Copyright © 2020 iosdev. All rights reserved.
//

import UIKit

final class NewsListItemCollectionCell: UICollectionViewCell, ReusableView {
  // MARK: - Properties.
  lazy var width: NSLayoutConstraint = {
    let width = contentView.widthAnchor.constraint(equalToConstant: bounds.size.width)
    width.isActive = true
    return width
  }()
  private let imageView = ImageViewBuilder()
    .contentMode(.scaleAspectFill)
    .maskToBounds(true)
    .build()
  private let titleLabel = LabelBuilder()
    .alignment(.center)
    .font(UIFont.systemFont(ofSize: 18, weight: .bold))
    .numberOfLines(0)
    .build()
  private let descriptionLabel = LabelBuilder()
    .alignment(.center)
    .numberOfLines(0)
    .font(UIFont.systemFont(ofSize: 14, weight: .medium))
    .build()
  private let providerLabel = LabelBuilder()
    .alignment(.right)
    .font(UIFont.systemFont(ofSize: 10, weight: .light))
    .numberOfLines(0)
    .build()
  // MARK: - Initializer Methods.
  override init(frame: CGRect) {
    super.init(frame: frame)
    viewSetup()
    viewLayout()
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  // MARK: - View Setup & Layout
  private func viewSetup() {
    contentView.translatesAutoresizingMaskIntoConstraints = false
    contentView.addSubviews(imageView, titleLabel, descriptionLabel, providerLabel)
  }
  private func viewLayout() {
    imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Padding.mini.cgFloat).isActive = true
    imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Padding.small.cgFloat).isActive = true
    imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Padding.small.cgFloat).isActive = true
    imageView.heightAnchor.constraint(equalToConstant: Height.newsCellImageView.cgFloat).isActive = true
    titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: Padding.medium.cgFloat).isActive = true
    titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Padding.small.cgFloat).isActive = true
    titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Padding.small.cgFloat).isActive = true
    descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Padding.medium.cgFloat).isActive = true
    descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
    descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
    providerLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: Padding.small.cgFloat).isActive = true
    providerLabel.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor).isActive = true
    if let lastSubview = contentView.subviews.last {
      contentView.bottomAnchor.constraint(equalTo: lastSubview.bottomAnchor, constant: Padding.mini.cgFloat).isActive = true
    }
  }
  // MARK: - Helper
  /// Adaptive
  override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
    width.constant = bounds.size.width
    return contentView.systemLayoutSizeFitting(CGSize(width: targetSize.width, height: 0))
  }
  /// Injection ViewModel
  func configure(with viewModel: NewsListItemViewViewModel) {
    titleLabel.text = viewModel.title
    descriptionLabel.text = viewModel.description
    providerLabel.text = viewModel.sourceName
    if let imageURL = viewModel.imageURL{
      imageView.load(url: imageURL, placeholder: nil)
    }
  }
}
