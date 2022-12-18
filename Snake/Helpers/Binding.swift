//
//  Binding.swift
//  Snake
//
//  Created by Magomedcoder on 18.12.2022.
//

import SwiftUI

extension Binding {
    
    func onChanged(perform action: @escaping (Value) -> Void) -> Self {
        Binding(
            get: { wrappedValue },
            set: { newValue in
                wrappedValue = newValue
                action(newValue)
            }
        )
    }
    
    init(_ staticValue: Value) {
        self.init(
            get: { staticValue },
            set: { _ in }
        )
    }
    
}

func logErrorIntro(file: String = #file, line: UInt = #line) {
    print("Ошибка: файл-\(file) | строка-\(line)")
}

func NSError(_ error: Error, file: String = #file, line: UInt = #line) {
    logErrorIntro(file: file, line: line)
    print("Ошибка: \(error)")
}

func NSError(_ message: String, file: String = #file, line: UInt = #line) {
    logErrorIntro(file: file, line: line)
    print("Ошибка: \(message)")
}
