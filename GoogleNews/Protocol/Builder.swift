//
//  Builder.swift
//  GoogleNews
//
//  Created by iosdev on 11.02.2020.
//  Copyright © 2020 iosdev. All rights reserved.
//

import Foundation

public protocol Builder {
  associatedtype T
  func build() -> T
}
