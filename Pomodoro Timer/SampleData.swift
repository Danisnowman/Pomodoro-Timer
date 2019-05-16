//
//  SampleData.swift
//  Pomodoro Timer
//
//  Created by Daniel Hernández on 4/17/19.
//  Copyright © 2019 Daniel Hernández. All rights reserved.
//

import Foundation

final class SampleData {
    
    static func generateTaskDataSamples() -> [Task] {
        return [
            Task(name: "Terminar Estructura",
                 objective: "Estructuras de Datos",
                 difficulty: 5
            ),
            Task(name: "Estudiar Micro",
                 objective: "Microeconomía",
                 difficulty: 4
            ),
            Task(name: "Leer Micro",
                 objective: "Microeconomía",
                 difficulty: 3
            ),
            Task(name: "Estudiar Costos",
                 objective: "Cost Analysis",
                 difficulty: 2
            ),
            Task(name: "Repasar Estadística",
                 objective: "Statistical Thinking I",
                 difficulty: 2
            )
        ]
    }
}
