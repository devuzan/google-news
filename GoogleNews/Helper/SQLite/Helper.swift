//
//  Helper.swift
//  GoogleNews
//
//  Created by iosdev on 12.02.2020.
//  Copyright © 2020 iosdev. All rights reserved.
//

import UIKit
import SQLite3

enum SQLiteError: Error {
  case OpenDatabase(message: String)
  case Prepare(message: String)
  case Step(message: String)
  case Bind(message: String)
}

struct SQLiteHelper {
  static var documentDirectoryURL: URL? {
    try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
  }
  public let dbPath = DBName.news.path
  private enum DBName: String {
    case news
    var path: String? {
      return documentDirectoryURL?.appendingPathComponent("\(self.rawValue).sqlite").relativePath
    }
  }
  private func destroyDatabase(db: DBName) {
    guard let path = db.path else { return }
    do {
      if FileManager.default.fileExists(atPath: path) {
        try FileManager.default.removeItem(atPath: path)
      }
    } catch {
      print("Could not destroy \(db) Database file.")
    }
  }
  func destroyNewsDb() {
    destroyDatabase(db: .news)
  }
}
