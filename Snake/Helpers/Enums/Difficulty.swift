//
//  Difficulty.swift
//  Snake
//
//  Created by Magomedcoder on 18.12.2022.
//

import Foundation

enum Difficulty: UInt, CaseIterable {
    
    case large = 41
    case medium = 31
    case small = 21
    
    var stringValue: String {
        switch self {
        case .large:
            return "41"
        case .medium:
            return "31"
        case .small:
            return "21"
        }
    }
    
    var interval: Double {
        switch self {
        case .large:
            return 0.1
        case .medium:
            return 0.11
        case .small:
            return 0.12
        }
    }
}
