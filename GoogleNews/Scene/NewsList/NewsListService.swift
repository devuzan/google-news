//
//  NewsService.swift
//  GoogleNews
//
//  Created by iosdev on 11.02.2020.
//  Copyright © 2020 iosdev. All rights reserved.
//

import Foundation

final class NewsListService: NewsListServiceProtocol {
  // MARK: - Initializer Method.
  init (){ }
  // MARK: - Fetch For Decodable Object
  func fetch<T: Decodable>(with serviceURL: URL, responseObject: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
    URLSession.shared.dataTask(with: serviceURL) { (data, response, error) in
      if let data = data {
        do {
          let response = try JSONDecoder().decode(T.self, from: data)
          completion(.success(response))
        }catch let parseError {
          completion(.failure(parseError))
        }
      }else if let responseError = error {
        completion(.failure(responseError))
      }
    }.resume()
  }
}
