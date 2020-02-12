//
//  UIViewController+Alert.swift
//  GoogleNews
//
//  Created by iosdev on 12.02.2020.
//  Copyright © 2020 iosdev. All rights reserved.
//

import UIKit

extension UIViewController {
  func showAlert(with title: String, message: String) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    alertController.addAction(okAction)
    DispatchQueue.main.async {
      self.present(alertController, animated: true, completion: nil)
    }
  }
}
