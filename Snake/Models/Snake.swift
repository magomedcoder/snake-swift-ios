//
//  Snake.swift
//  Snake
//
//  Created by Magomedcoder on 18.12.2022.
//

import Foundation

struct Snake {
    
    let head: Position
    let body: [Position]
    let direction: Direction
    
    var fullBody: [Position] {
        return [head] + body
    }
    
    var isValid: Bool {
        let full = fullBody
        var prevPos = head
        for pos in body {
            guard full.filter({
                $0 == pos
            }).count <= 1 else {
                return false
            }
            
            let dx = abs(Int(pos.x) - Int(prevPos.x))
            let dy = abs(Int(pos.y) - Int(prevPos.y))
            
            guard dx + dy == 1 else { return false }
            prevPos = pos
        }
        
        return true
    }
    
    init(head: Position, body: [Position], direction: Direction) {
        self.head = head
        self.body = body
        self.direction = direction
    }
    
    func move() -> Snake {
        let newHead = head.next(in: direction)
        let b = fullBody
        let newBody: [Position] = b.isEmpty ? [] : Array(b[0..<b.count - 1])
        
        return Snake(head: newHead, body: Array(newBody), direction: direction)
    }
    
    func grow() -> Snake {
        Snake(head: head.next(in: direction), body: fullBody, direction: direction)
    }
    
    func direction(_ newDirection: Direction) -> Snake {
        Snake(head: head, body: body, direction: newDirection)
    }
    
    static var empty: Self {
        Snake(head: .zero, body: [], direction: .defaultStartDirection)
    }
}

