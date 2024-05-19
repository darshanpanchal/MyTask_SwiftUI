//
//  TaskViewModel.swift
//  MyTask
//
//  Created by Darshan on 13/05/24.
//

import Foundation

final class TaskViewModel: ObservableObject {
    
    @Published var tasks: [Task] = []
    
    private var tempTask = Task.createMockTasks()
    
    
    func getTasks(isActive: Bool){
        tasks = tempTask.filter{$0.isActive == isActive}
    }
    func addTask(task: Task) -> Bool{
        let taskId = Int.random(in: 4...100)
        let taskToAdd = Task(id: taskId,
                             name: task.name,
                             description: task.description,
                             isActive: true,
                             finishDate:task.finishDate)
        tempTask.append(taskToAdd)
        return true
    }
    func updateTask(task: Task)->Bool{
        if let index = tempTask.firstIndex(where: {$0.id == task.id}) {
            tempTask[index].name = task.name
            tempTask[index].description = task.description
            tempTask[index].isActive = task.isActive
            tempTask[index].finishDate = task.finishDate
            return true
        }
        return false
    }
    func deleteTask(task: Task)->Bool{
        if let index = tempTask.firstIndex(where: {$0.id == task.id}) {
            tempTask.remove(at: index)
            return true
        }
        return false
        
    }
}
