//
//  RootApplication.swift
//  Snake
//
//  Created by Magomedcoder on 18.12.2022.
//

import SwiftUI

struct RootApplication: View {
    
    @EnvironmentObject
    private var snakeViewModel: SnakeGameViewModel
    
    @EnvironmentObject
    private var selectedIndexVm: SegmentedPicker.ViewModel
    
    @State private var showMenu = false
    
    private var startMenu: some View {
        DifficultySelector(
            selectedIndexVm: selectedIndexVm,
            score: snakeViewModel.score,
            didLose: snakeViewModel.isDead
        ) {
            difficulty in
            showMenu = false
            snakeViewModel.startNewGame(difficulty: difficulty)
        }
    }
    
    private var gesture: some Gesture {
        DragGesture()
            .onEnded { value in
                let xOffset = value.startLocation.x - value.location.x
                let yOffset = value.startLocation.y - value.location.y
                let newDirection: Direction
                if abs(xOffset) > abs(yOffset) {
                    if xOffset < 0 {
                        newDirection = .right
                    } else {
                        newDirection = .left
                    }
                } else {
                    if yOffset > 0 {
                        newDirection = .up
                    } else {
                        newDirection = .down
                    }
                }
                snakeViewModel.changeDirection(to: newDirection)
            }
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                if !showMenu {
                    SnakeGame(vm: snakeViewModel, didLose: $showMenu)
                }
            }
            .gesture(gesture)
            .sheet(isPresented: $showMenu, content: {
                startMenu
            })
            .onAppear {
                showMenu = true
            }
            .onReceive(snakeViewModel.$isDead, perform: { bool in
                showMenu = bool
            })
        }
    }
}

struct App_Previews: PreviewProvider {
    static var previews: some View {
        RootApplication()
    }
}
