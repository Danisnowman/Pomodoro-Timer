//
//  SampleData.swift
//  Pomodoro Timer
//
//  Created by Daniel Hernández on 4/17/19.
//  Copyright © 2019 Daniel Hernández. All rights reserved.
//

import Foundation

final class SampleData {
    
    static func generatePlayersData() -> [Task] {
        return [
            Task(name: "Terminar Estructura", priority: 8, difficulty: 11),
            Task(name: "Leer Micro", priority: 3, difficulty: 2),
            Task(name: "Estudiar Costos", priority: 7, difficulty: 3)
        ]
    }
}
