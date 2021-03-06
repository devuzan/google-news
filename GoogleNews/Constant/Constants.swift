//
//  GoogleNews.swift
//  GoogleNews
//
//  Created by iosdev on 16.02.2020.
//  Copyright © 2020 iosdev. All rights reserved.
//

import Foundation

enum Constants {
  static let apiKey = "261a9da6f46446f695ff9f78108f71d7"
  static let newsURL = URL(string: "https://newsapi.org/v2/top-headlines?sources=google-news&apiKey=\(Constants.apiKey)")
  static let newsTitle = "Google News"
  static let columnID = "id"
  static let columnTitle = "title"
  static let columnImageUrl = "imageurl"
  static let columnDescription = "description"
  static let columnUrl = "url"
  static let columnSource = "source"
  static let dbName = "news"
  static let tableName = "news"
}

enum Padding {
  static let large: Float = 32.0
  static let medium: Float = 16.0
  static let small: Float = 8.0
  static let mini: Float = 4.0
}

enum Height {
  static let newsCellImageView: Float = 128
}
