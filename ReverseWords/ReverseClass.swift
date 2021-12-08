//
//  ReverseClass.swift
//  ReverseWords
//
//  Created by Dmitrii on 08.12.2021.
//

import Foundation

class ReverseClass {
    static  func reverseString(textInput:String) -> String {
        return  textInput.split(separator: " ").map {String($0.reversed())}.joined(separator: " ")
    }
}
