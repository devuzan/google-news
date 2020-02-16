//
//  Indicator.swift
//  GoogleNews
//
//  Created by iosdev on 16.02.2020.
//  Copyright © 2020 iosdev. All rights reserved.
//

import UIKit

public final class ActivitIndicatorBuilder: Builder {
  let indicator: UIActivityIndicatorView!
  init(style: UIActivityIndicatorView.Style) {
    indicator = UIActivityIndicatorView(style: style)
  }
  public func frame(_ frame: CGRect) -> Self {
    indicator.frame = frame
    return self
  }
  public func hidesWhenStopped(_ hidesWhenStopped: Bool) -> Self {
    indicator.hidesWhenStopped = hidesWhenStopped
    return self
  }
  public func color(_ color: UIColor) -> Self{
    indicator.color = color
    return self
  }
  public func build() -> UIActivityIndicatorView {
    return indicator
  }
}
