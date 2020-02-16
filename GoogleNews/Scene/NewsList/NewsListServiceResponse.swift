//
//  NewsServiceResponse.swift
//  GoogleNews
//
//  Created by iosdev on 11.02.2020.
//  Copyright © 2020 iosdev. All rights reserved.
//

import Foundation

class NewsListServiceResponse: Decodable {
  // MARK: - Properties.
  var status: String?
  var totalResults: Int?
  var list: [NewsListServiceItemResponse]?
  enum CodingKeys: String, CodingKey {
    case list = "articles"
  }
}
