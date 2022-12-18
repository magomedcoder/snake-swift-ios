//
//  Set.swift
//  Snake
//
//  Created by Magomedcoder on 18.12.2022.
//

import UIKit

extension Set where Element == UIKeyboardHIDUsage {
    
    static let wasd: Self = [
        .keyboardW,
        .keyboardA,
        .keyboardS,
        .keyboardD
    ]
    
    static let arrows: Self = [
        .keyboardUpArrow,
        .keyboardLeftArrow,
        .keyboardDownArrow,
        .keyboardRightArrow
    ]
    
}

extension Set {
    
    func withInsertedElement(_ element: Element) -> Self {
        withInsertedElements([element])
    }
    
    func withInsertedElements(_ set: Set<Element>) -> Self {
        var copy = self
        for element in set {
            copy.insert(element)
        }
        return copy
    }
    
}
