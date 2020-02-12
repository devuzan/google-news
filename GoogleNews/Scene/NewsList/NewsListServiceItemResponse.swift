//
//  NewsServiceItemResponse.swift
//  GoogleNews
//
//  Created by iosdev on 11.02.2020.
//  Copyright © 2020 iosdev. All rights reserved.
//

import Foundation

final class NewsListServiceItemResponse: Decodable {
  // MARK: - Properties.
  var title: String?
  var description: String?
  var urlToImage: String?
  var source: NewsListServiceItemSourceResponse?
  var url: URL?
}
