//
//  File.swift
//  GoogleNews
//
//  Created by iosdev on 12.02.2020.
//  Copyright © 2020 iosdev. All rights reserved.
//

import Foundation

final class NewsListItemPresentationModel {
  // MARK: - Properties.
  var title: String?
  var urlToImage: String?
  var description: String?
  var url: URL?
  var sourceName: String?
  // MARK: - Initializer Method.
  init(with response: NewsListServiceItemResponse) {
    self.title = response.title
    self.urlToImage = response.urlToImage
    self.description = response.description
    self.url = response.url
    self.sourceName = response.source?.name
  }
}
