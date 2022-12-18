//
//  Rectangle.swift
//  Snake
//
//  Created by Magomedcoder on 18.12.2022.
//

import SwiftUI

extension Rectangle {
    
    @ViewBuilder
    func cellStyle(_ style: CellStyle, color: Color) -> some View {
        switch style {
        case let .outline(width):
            self.border(color, width: width)
        case .filled:
            self.foregroundColor(color)
        }
    }
    
}
