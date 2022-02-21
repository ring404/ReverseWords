//
//  ReverseStringManager.swift
//  ReverseWords
//
//  Created by Dmitrii on 15.12.2021.
//

import Foundation

class ReverseStringManager {
    func reverseString(text:String, splitSeparator: Character = " ", joinedSeparator: String = " ") -> String {
        return text.split(separator: splitSeparator).map({String($0.reversed())}).joined(separator: String(joinedSeparator))
    }
    
    func reverseStringDefaultState(text:String) -> String {
        let alphabeticCharactersSet:CharacterSet = .letters
        let characterArray = Array(text)
        var alphabeticCharArray = [Character]()
        for char in characterArray {
            if isCharInCharset(alphabeticCharactersSet, char) || char == " " {
                alphabeticCharArray.append(char)
            }
        }
        let alphabeticCharArrayReversed = Array(reverseString(text: String(alphabeticCharArray), joinedSeparator: ""))
        
        var finalCharArray = [Character]()
        var n = 0
        
        for char in characterArray {
            if isCharInCharset(alphabeticCharactersSet, char) {
                finalCharArray.append(alphabeticCharArrayReversed[n])
                n += 1
            } else {
                finalCharArray.append(char)
            }
        }
        return String(finalCharArray)
    }
    
    func reverseStringWithExclusion(text:String, exclusion:String) -> String {
        var alphabeticCharactersSet:CharacterSet = .alphanumerics
        alphabeticCharactersSet.formUnion(.punctuationCharacters)
        alphabeticCharactersSet.remove(charactersIn: exclusion)
        print(alphabeticCharactersSet.description)
        let characterArray = Array(text)
        var alphabeticCharArray = [Character]()
        for char in characterArray {
            if isCharInCharset(alphabeticCharactersSet, char) || char == " " {
                alphabeticCharArray.append(char)
            }
        }
        let alphabeticCharArrayReversed = Array(reverseString(text: String(alphabeticCharArray), joinedSeparator: ""))
        
        var finalCharArray = [Character]()
        var n = 0
        
        for char in characterArray {
            if isCharInCharset(alphabeticCharactersSet, char) {
                finalCharArray.append(alphabeticCharArrayReversed[n])
                n += 1
            } else {
                finalCharArray.append(char)
            }
        }
        return String(finalCharArray)
    }
    
    func isCharInCharset(_ cs: CharacterSet, _ char: Character) -> Bool {
        let convertedChar = char.unicodeScalars
        let mappedChar = convertedChar.map {$0}[0]
        return cs.contains(mappedChar)
    }
}
