//
//  NewsService.swift
//  GoogleNews
//
//  Created by iosdev on 11.02.2020.
//  Copyright © 2020 iosdev. All rights reserved.
//

import Foundation

enum Error: Swift.Error {
  case noData(String)
  case noResponse(String)
  case parse(String)
}

final class NewsListService: NewsListServiceProtocol {
  init (){ }
  func fetch<T: Decodable>(with serviceURL: URL, decodable: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
    URLSession.shared.dataTask(with: serviceURL) { (data, response, error) in
      guard var _ = response else {
        completion(.failure(.noResponse("No Response")))
        return
      }
      guard let data = data else {
        completion(.failure(.noData("No Data")))
        return
      }
      do {
        let response = try JSONDecoder().decode(T.self, from: data)
        completion(.success(response))
      }catch let error {
        completion(.failure(.parse(error.localizedDescription)))
      }
    }.resume()
  }
}
