//
//  Task.swift
//  MyTask
//
//  Created by Darshan on 13/05/24.
//

import Foundation

struct Task {
    let id: Int
    var name: String
    var description: String
    var isActive: Bool
    var finishDate: Date
    
    static func createMockTasks() -> [Task] {
        return [
            Task(id: 1, name: "Go to gym", description: "Back Workout", isActive: true, finishDate: Date())
            ,
            Task(id: 2, name: "Car wash", description: "Downtoen car wash center", isActive: true, finishDate: Date()),
            Task(id: 3, name: "Office Work", description: "Finish Picker Module", isActive: false, finishDate: Date()),
            Task(id: 2, name: "Car wash", description: "Downtoen car wash center", isActive: true, finishDate: Date()),
        ]
    }
}

