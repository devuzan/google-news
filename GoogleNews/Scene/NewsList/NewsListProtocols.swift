//
//  NewsProtocols.swift
//  GoogleNews
//
//  Created by iosdev on 11.02.2020.
//  Copyright © 2020 iosdev. All rights reserved.
//

import Foundation

protocol NewsListServiceProtocol {
  func fetch<T: Decodable>(with serviceURL: URL, responseObject: T.Type, completion: @escaping (Result<T, Error>) -> Void)
}

protocol NewsListViewViewModelProtocol {
  func fetch(completion: @escaping (Error?) -> Void)
}
