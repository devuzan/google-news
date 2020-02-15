//
//  Table.swift
//  GoogleNews
//
//  Created by iosdev on 16.02.2020.
//  Copyright © 2020 iosdev. All rights reserved.
//

import SQLite

final class NewsTable {
  // MARK: - Properties.
  private let table: Table
  //private let id = Expression<Int64>(Constants.columnID)
  private let title = Expression<String>(Constants.columnTitle)
  private let imageUrl = Expression<String>(Constants.columnImageUrl)
  private let description = Expression<String>(Constants.columnDescription)
  private let url = Expression<String>(Constants.columnUrl)
  private let source = Expression<String>(Constants.columnSource)
  private let db:Database
  // MARK: Initializer Method.
  init(with db: Database, table: String) throws {
    self.db = db
    self.table = Table(table)
    try db.connection.run(self.table.create(ifNotExists: true) { t in
      //t.column(id, primaryKey: .autoincrement)
      t.column(title)
      t.column(imageUrl)
      t.column(description)
      t.column(url, unique: true)
      t.column(source)
    })
  }
  // MARK: - Helper Methods.
  /// Insert Response Object
  func insert(response: NewsListServiceResponse) throws {
    do {
      try response.list?.forEach({ (responseObject) in
        try db.connection.run(self.table.insert(or: .replace,
          title <- responseObject.title ?? "",
          imageUrl <- responseObject.urlToImage ?? "",
          description <- responseObject.description ?? "",
          url <- responseObject.url?.absoluteString ?? "",
          source <- responseObject.source?.name ?? ""
        ))
      })
    } catch let error {
      throw error
    }
  }
  /// Fetch Presentation Model Objects
  func fetch() throws -> [NewsListItemPresentationModel] {
    var list = [NewsListItemPresentationModel]()
    do {
      for news in try db.connection.prepare(table) {
        let newsTitle = news[title]
        let newsImageUrl = news[imageUrl]
        let newsDescription = news[description]
        let newsUrl = news[url]
        let newsSource = news[source]
        let newsItem = NewsListItemPresentationModel(with: newsTitle, imageUrl: newsImageUrl, description: newsDescription, url: newsUrl, source: newsSource)
        list.append(newsItem)
      }
    } catch let error {
      throw error
    }
    return list
  }
}
