//
//  NewsProtocols.swift
//  GoogleNews
//
//  Created by iosdev on 11.02.2020.
//  Copyright © 2020 iosdev. All rights reserved.
//

import Foundation

protocol NewsListServiceProtocol {
  func fetch<T: Decodable>(with serviceURL: URL, decodable: T.Type, completion: @escaping (Result<T, WebServiceError>) -> Void)
}
