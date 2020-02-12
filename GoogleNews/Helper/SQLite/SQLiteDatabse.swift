//
//  SQLiteDatabse.swift
//  GoogleNews
//
//  Created by iosdev on 12.02.2020.
//  Copyright © 2020 iosdev. All rights reserved.
//

import Foundation
import SQLite3

class SQLiteDatabase {
  private let dbPointer: OpaquePointer?
  private init(dbPointer: OpaquePointer?) {
    self.dbPointer = dbPointer
  }
  
  fileprivate var errorMessage: String {
    if let errorPointer = sqlite3_errmsg(dbPointer) {
      let errorMessage = String(cString: errorPointer)
      return errorMessage
    } else {
      return "No error message provided from sqlite."
    }
  }
  
  deinit {
    sqlite3_close(dbPointer)
  }
  
  static func open(path: String) throws -> SQLiteDatabase {
    var db: OpaquePointer?
    // 1
    if sqlite3_open(path, &db) == SQLITE_OK {
      // 2
      return SQLiteDatabase(dbPointer: db)
    } else {
      // 3
      defer {
        if db != nil {
          sqlite3_close(db)
        }
      }
      if let errorPointer = sqlite3_errmsg(db) {
        let message = String(cString: errorPointer)
        throw SQLiteError.OpenDatabase(message: message)
      } else {
        throw SQLiteError.OpenDatabase(message: "No error message provided from sqlite.")
      }
    }
  }
}
