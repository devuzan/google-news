//
//  UIImageView+Download.swift
//  GoogleNews
//
//  Created by iosdev on 11.02.2020.
//  Copyright © 2020 iosdev. All rights reserved.
//

import UIKit

extension UIImageView {
  func load(url: URL, placeholder: UIImage?, cache: URLCache? = nil) {
    let cache = cache ?? URLCache.shared
    let request = URLRequest(url: url)
    if let data = cache.cachedResponse(for: request)?.data, let image = UIImage(data: data) {
      self.image = image
    } else {
      self.image = placeholder
      URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
        if let data = data,
          let response = response,
          ((response as? HTTPURLResponse)?.statusCode ?? 500) < 300,
          let image = UIImage(data: data) {
          let cachedData = CachedURLResponse(response: response, data: data)
          cache.storeCachedResponse(cachedData, for: request)
          DispatchQueue.main.async { [weak self] in
            self?.image = image
          }
        }
      }).resume()
    }
  }
}
