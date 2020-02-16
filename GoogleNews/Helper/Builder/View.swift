//
//  View.swift
//  GoogleNews
//
//  Created by iosdev on 12.02.2020.
//  Copyright © 2020 iosdev. All rights reserved.
//

import UIKit

public final class UIViewBuilder: Builder {
  private let view: UIView
  public init() {
    view = UIView(frame: .zero)
  }
  public func backgroundColor(_ backgroundColor: UIColor = .clear) -> Self {
    view.backgroundColor = backgroundColor
    return self
  }
  public func cornerRadius(_ cornerRadius: CGFloat) -> Self {
    view.layer.cornerRadius = cornerRadius
    return self
  }
  public func borderColor(_ borderColor: UIColor) -> Self {
    view.layer.borderColor = borderColor.cgColor
    return self
  }
  public func borderWidth(_ borderWidth: CGFloat) -> Self {
    view.layer.borderWidth = borderWidth
    return self
  }
  public func maskToBound(_ status: Bool) -> Self {
    view.layer.masksToBounds = status
    return self
  }
  public func build() -> UIView {
    return view
  }
}
