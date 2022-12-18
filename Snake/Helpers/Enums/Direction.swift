//
//  Direction.swift
//  Snake
//
//  Created by Magomedcoder on 18.12.2022.
//

import Foundation

enum Direction: Equatable {
    
    case up, down, left, right
    
    var opposite: Self {
        switch self {
        case .up:
            return .down
        case .down:
            return .up
        case .left:
            return .right
        case .right:
            return .left
        }
    }
    
    static var defaultStartDirection: Self = .up
}
