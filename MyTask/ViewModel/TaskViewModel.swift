//
//  TaskViewModel.swift
//  MyTask
//
//  Created by Darshan on 13/05/24.
//

import Foundation

final class TaskViewModel: ObservableObject {
    
    @Published var tasks: [Task] = []
    
    func getTasks(isActive: Bool){
        tasks = Task.createMockTasks().filter{$0.isActive == isActive}        
    }
    
}
