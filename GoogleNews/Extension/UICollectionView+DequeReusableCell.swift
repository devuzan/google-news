//
//  UICollectionView+DequeReusableCell.swift
//  GoogleNews
//
//  Created by iosdev on 11.02.2020.
//  Copyright © 2020 iosdev. All rights reserved.
//

import UIKit

extension UICollectionView {
  func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T where T: ReusableView {
    register(T.self)
    guard let cell = dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as? T else {
      fatalError("Could not dequeue cell with identifier: \(T.identifier)")
    }
    return cell
  }
}

