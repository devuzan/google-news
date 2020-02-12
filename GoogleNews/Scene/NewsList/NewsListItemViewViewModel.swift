//
//  NewsItemViewModel.swift
//  GoogleNews
//
//  Created by iosdev on 11.02.2020.
//  Copyright © 2020 iosdev. All rights reserved.
//

import Foundation
final class NewsListItemViewViewModel {
  var title: String {
    model.title ?? ""
  }
  var imageURL: URL? {
    if let urlString = model.urlToImage{
      return URL(string: urlString)
    }
    return nil
  }
  var description: String {
    // to HTML
    model.description?.stripOutHtml() ?? ""
  }
  var url: URL? {
    model.url
  }
  var sourceName: String {
    model.sourceName ?? ""
  }
  private let model: NewsListItemPresentationModel
  init(with response: NewsListServiceItemResponse) {
    self.model = NewsListItemPresentationModel(with: response)
  }
}
