//
//  UIView+AddSubviews.swift
//  GoogleNews
//
//  Created by iosdev on 11.02.2020.
//  Copyright © 2020 iosdev. All rights reserved.
//

import UIKit

extension UIView{
  public func addSubviews(autoLayoutIsEnabled: Bool = true, _ subviews: UIView...) {
    subviews.forEach { (view) in
      view.translatesAutoresizingMaskIntoConstraints = !autoLayoutIsEnabled
      addSubview(view)
    }
  }
}
