//
//  ReverseStringManager.swift
//  ReverseWords
//
//  Created by Dmitrii on 15.12.2021.
//

import Foundation

class ReverseStringManager {
    static func reverseString(text:String) -> String {
        return text.split(separator: " ").map({String($0.reversed())}).joined(separator: " ")
    }
}
