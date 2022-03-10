//
//  UIKit+extension.swift
//  ReverseWords
//
//  Created by Dmitrii on 25.02.2022.
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
