//
//  KeyHostingController.swift
//  Snake
//
//  Created by Magomedcoder on 18.12.2022.
//

import SwiftUI

extension UIKey {
    var desc: String {
        switch keyCode {
        case .keyboardDownArrow:
            return "Down Arrow"
        case .keyboardUpArrow:
            return "Up Arrow"
        case .keyboardLeftArrow:
            return "Left Arrow"
        case .keyboardRightArrow:
            return "Right Arrow"
        default:
            return characters
        }
    }
}

class KeyHostingController<Content>: UIHostingController<Content> where Content: View {
    
    @Binding
    private var currentKey: UIKeyboardHIDUsage?
    
    private var keyCodesToHandle: Set<UIKeyboardHIDUsage>?
    
    init(
        currentKeyCode: Binding<UIKeyboardHIDUsage?>,
        allowedKeys: Set<UIKeyboardHIDUsage>? = nil,
        rootView: Content
    ) {
        self._currentKey = currentKeyCode
        self.keyCodesToHandle = allowedKeys
        super.init(rootView: rootView)
    }
    
    @MainActor
    @objc
    required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("инициализация(coder:) не будет реализована")
    }
    
    override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        print("UIView presses начал вызываться: " + (presses.first?.key?.desc ?? "nil"))
        guard let key = presses.first?.key?.keyCode,
              keyCodesToHandle?.contains(key) ?? true
        else { return }
        
        currentKey = presses.first?.key?.keyCode
    }
    
    override func pressesEnded(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        guard let key = presses.first?.key?.keyCode,
              keyCodesToHandle?.contains(key) ?? true
        else { return }
        
        currentKey = nil
    }
}

