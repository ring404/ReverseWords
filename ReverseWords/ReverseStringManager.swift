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
    
    func reverseStringDefaultState(text:String) -> String {
        let alphabeticCharactersSet = CharacterSet(charactersIn:"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ")
        let characterArray = Array(text)
        var alphabeticCharArray = [Character]()
        for char in characterArray {
            if isCharAlpabetic(alphabeticCharactersSet, char) {
                alphabeticCharArray.append(char)
            }
        }
        var alphabeticCharArrayReversed = Array(reverseString(text: String(alphabeticCharArray)))
        
        // MARK: - Костыль. Тк функция использует пробел как сепаратор между словами,
        // MARK: - то когда "слово" состоит только из цифр и спецсимволов, пробел перед ним теряется
        if alphabeticCharArray.last == " " {
            alphabeticCharArrayReversed.append(" ")
        }
        
        var finalCharArray = [Character]()
        var n = -1
        if alphabeticCharArray.count == alphabeticCharArrayReversed.count {
        for char in characterArray {
            if isCharAlpabetic(alphabeticCharactersSet, char) {
                n += 1
                finalCharArray.append(alphabeticCharArrayReversed[n])
            } else {
                finalCharArray.append(char)
            }
        }
        return String(finalCharArray)
        } else {
            return "Костыль не сработал!"
        }
    }
    
    func isCharAlpabetic(_ cs: CharacterSet, _ char: Character) -> Bool {
        let convertedChar = char.unicodeScalars
        let mappedChar = convertedChar.map {$0}[0]
        return cs.contains(mappedChar)
    }
}
