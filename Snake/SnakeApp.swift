//
//  SnakeApp.swift
//  Snake
//
//  Created by Magomedcoder on 18.12.2022.
//

import SwiftUI

@main
struct SnakeApp: App {

    @StateObject
    private var snakeViewModel = SnakeGameViewModel(difficulty: .medium)
    
    @StateObject
    private var selectedIndexVm: SegmentedPicker.ViewModel = .init()
    
    @StateObject
    private var multiplayerViewModel: MultiplayerViewModel = .init()
    
    var body: some Scene {
        WindowGroup {
            Text("Загрузка...")
                .frame(idealWidth: .infinity, idealHeight: .infinity)
                .withHostingWindow { window in
                    guard let window = window else {
                        fatalError("Не удалось прикрепить к окну")
                    }
                    window.rootViewController = KeyHostingController(
                        currentKeyCode: .init(
                            get: {
                                nil
                            },
                            set: {
                                let direction: Direction
                                switch $0 {
                                case .keyboardUpArrow, .keyboardW:
                                    direction = .up
                                case .keyboardLeftArrow, .keyboardA:
                                    direction = .left
                                case .keyboardDownArrow, .keyboardS:
                                    direction = .down
                                case .keyboardRightArrow, .keyboardD:
                                    direction = .right
                                default:
                                    return
                                }
                                snakeViewModel.changeDirection(to: direction)
                            }
                        ),
                        allowedKeys: .wasd.withInsertedElements(.arrows),
                        rootView: RootApplication()
                            .environmentObject(snakeViewModel)
                            .environmentObject(selectedIndexVm)
                            .environmentObject(multiplayerViewModel)
                    )
                }
        }
    }
}
