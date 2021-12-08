//
//  extensionsUIViewController.swift
//  ReverseWords
//
//  Created by Dmitrii on 08.12.2021.
//

import Foundation
import UIKit

extension UIViewController {
    enum UsedFonts {
        static   let headerFont = UIFont(name: "SFProDisplay-Bold", size: 34)
        static  let labelFont = UIFont(name: "SFProDisplay-Regular", size: 17)
        static  let inputFont = UIFont(name: "SFProDisplay-Regular", size: 17)
        static let outputFont = UIFont(name: "SFProDisplay-Regular", size: 24)
    }
    enum UsedColors {
        static   let black = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        static  let blue =  UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
        static  let gray = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
    }
    enum ButtonConditions {
        static let clear = "Clear"
        static let reverse = "Reverse"
    }
}
