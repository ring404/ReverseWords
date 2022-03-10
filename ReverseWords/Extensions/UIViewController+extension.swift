//
//  UIViewController+extension.swift
//  ReverseWords
//
//  Created by Dmitrii on 25.02.2022.
//

import Foundation
import UIKit

extension UIViewController {
    func makeKeyboardHideOnTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTapOnView))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func handleTapOnView() {
        view.endEditing(true)
    }
}
