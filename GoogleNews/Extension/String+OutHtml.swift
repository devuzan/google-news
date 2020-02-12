//
//  String+OutHtml.swift
//  GoogleNews
//
//  Created by iosdev on 12.02.2020.
//  Copyright © 2020 iosdev. All rights reserved.
//

import Foundation

extension String {
  func stripOutHtml() -> String? {
    do {
      guard let data = self.data(using: .unicode) else {
        return nil
      }
      let attributed = try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
      return attributed.string
    } catch {
      return nil
    }
  }
}
