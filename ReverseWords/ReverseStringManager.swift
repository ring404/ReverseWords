//
//  ReverseStringManager.swift
//  ReverseWords
//
//  Created by Dmitrii on 15.12.2021.
//

import Foundation

class ReverseStringManager {
     func reverseString(text:String, separator: Character = " ") -> String {
        return text.split(separator: separator).map({String($0.reversed())}).joined(separator: String(separator))
    }
}
