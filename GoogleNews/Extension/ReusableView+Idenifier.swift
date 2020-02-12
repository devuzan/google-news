//
//  ReusableView.swift
//  GoogleNews
//
//  Created by iosdev on 11.02.2020.
//  Copyright © 2020 iosdev. All rights reserved.
//

import UIKit

extension ReusableView where Self: UIView {
  static var identifier: String {
    return String(describing: self)
  }
}
