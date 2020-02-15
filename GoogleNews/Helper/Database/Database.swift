//
//  Database.swift
//  GoogleNews
//
//  Created by iosdev on 16.02.2020.
//  Copyright © 2020 iosdev. All rights reserved.
//

import SQLite
import Foundation
import UIKit

final class Database {
  // MARK: - Properties.
  var connection: Connection!
  // MARK: - Initializer Method.
  init(with name: String) throws {
    let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
    print(path)
    do {
      self.connection = try Connection("\(path)/\(name).sqlite")
    } catch let error {
      throw error
    }
  }
}
