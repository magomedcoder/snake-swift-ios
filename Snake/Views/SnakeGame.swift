//
//  SnakeGame.swift
//  Snake
//
//  Created by Magomedcoder on 18.12.2022.
//

import SwiftUI

struct SnakeGame: View {
    
    @ObservedObject
    private var vm: SnakeGameViewModel
    
    @State
    private var dict: [Int : Set<Int>] = [:]
    
    @Binding
    private var didLose: Bool
    
    @Binding
    private var cellStyle: CellStyle
    private let borderWidth: CGFloat = 3
    
    init(difficulty: Difficulty, didLose: Binding<Bool>? = nil) {
        self.init(vm: SnakeGameViewModel(difficulty: difficulty), didLose: didLose)
    }
    
    init(vm: SnakeGameViewModel? = nil, didLose: Binding<Bool>? = nil) {
        let unwrappedVm = vm ?? SnakeGameViewModel(difficulty: .medium)
        self._vm = ObservedObject<SnakeGameViewModel>(wrappedValue: unwrappedVm)
        self._didLose = didLose ?? .init(get: { return unwrappedVm.isDead }, set: { _ in })
        self._cellStyle = .init(
            get: { return .filled },
            set: { _ in }
        )
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 0) {
                let hRange: [Int] = (0..<Int(vm.difficulty.rawValue)).reversed()
                Text("Змейка")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                ZStack(alignment: .top) {
                    VStack(alignment: .center, spacing: 0) {
                        ForEach(hRange, id: \.self) { y in
                            HStack(alignment: .center, spacing: 0) {
                                ForEach(hRange, id: \.self) { x in
                                    cell(at: Position(x: x, y: y))
                                }
                            }
                        }
                    }
                    .onReceive(vm.timer, perform: { _ in
                        if !vm.isDead {
                            vm.move(in: Bounds(width: hRange.count, height: hRange.count))
                        } else {
                            vm.timer.upstream.connect().cancel()
                        }
                    })
                    .padding(borderWidth)
                    .border(Color.white, width: borderWidth)
                    HStack {
                        Spacer()
                        Group {
                            switch cellStyle {
                            case let .outline(width):
                                StrokeText(
                                    text: "\(vm.score)",
                                    strokeWidth: width
                                ).padding([.top, .trailing], width)
                            case .filled:
                                Text("\(vm.score)")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                        }.font(.title)
                    }.padding([.trailing, .top], borderWidth)
                }
                Spacer()
                if vm.isDead {
                    Text("Проведите пальцем вверх, чтобы перезапустить").foregroundColor(.red)
                }
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SnakeGame()
    }
}
