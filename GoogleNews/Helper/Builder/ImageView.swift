//
//  ImageView.swift
//  GoogleNews
//
//  Created by iosdev on 11.02.2020.
//  Copyright © 2020 iosdev. All rights reserved.
//

import UIKit

public final class ImageViewBuilder: Builder {
  private let imageView: UIImageView
  public init() {
    imageView = UIImageView(frame: .zero)
  }
  public func image(_ image: UIImage?) -> Self {
    self.imageView.image = image
    return self
  }
  public func contentMode(_ contentMode: UIView.ContentMode) -> Self {
    self.imageView.contentMode = contentMode
    return self
  }
  public func cornerRadius(_ cornerRadius: CGFloat) -> Self {
    self.imageView.layer.cornerRadius = cornerRadius
    return self
  }
  public func maskToBounds(_ status: Bool) -> Self {
    self.imageView.layer.masksToBounds = status
    return self
  }
  public func build() -> UIImageView {
    return imageView
  }
}
