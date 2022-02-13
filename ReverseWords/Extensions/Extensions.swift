//
//  Extensions.swift
//  ReverseWords
//
//  Created by Dmitrii on 13.02.2022.
//

import Foundation
import UIKit

extension UIFont {
    static func main(weight: Weight = .regular, size: CGFloat) -> UIFont {
        switch weight {
        case .bold:
            return UIFont(name: "SFProDisplay-Bold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .bold)
        default:
            return UIFont(name: "SFProDisplay-Regular", size: size) ?? UIFont.systemFont(ofSize: size)
        }
    }
}

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

