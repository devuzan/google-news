//
//  Label.swift
//  GoogleNews
//
//  Created by iosdev on 11.02.2020.
//  Copyright © 2020 iosdev. All rights reserved.
//

import UIKit

public final class LabelBuilder: Builder {
  private let label: UILabel!
  public init() {
    label = UILabel(frame: .zero)
  }
  public func text(_ text: String) -> Self {
    label.text = text
    return self
  }
  public func attributedText(_ attributedText: NSAttributedString) -> Self {
    label.attributedText = attributedText
    return self
  }
  public func font(_ font: UIFont) -> Self {
    label.font = font
    return self
  }
  public func textColor(_ textColor: UIColor) -> Self {
    label.textColor = textColor
    return self
  }
  public func alignment(_ alignment: NSTextAlignment) -> Self {
    label.textAlignment = alignment
    return self
  }
  public func numberOfLines(_ numberOfLines: Int) -> Self {
    label.numberOfLines = 0
    return self
  }
  public func enabled(_ userInteractionEnabled: Bool) -> Self {
    label.isUserInteractionEnabled = userInteractionEnabled
    return self
  }
  public func lineBreakMode(_ lineBreakMode: NSLineBreakMode) -> Self {
    label.lineBreakMode = lineBreakMode
    return self
  }
  public func build() -> UILabel {
    return label
  }
}
