//
//  Button.swift
//  Pomodoro Timer
//
//  Created by Daniel Hernández on 4/16/19.
//  Copyright © 2019 Daniel Hernández. All rights reserved.
//

import Foundation

struct Button
{
    var hasBeenPressed = false
    var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIndentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Button.getUniqueIndentifier()
    }
}
