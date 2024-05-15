//
//  AddTaskView.swift
//  MyTask
//
//  Created by Darshan on 15/05/24.
//

import SwiftUI

struct AddTaskView: View {
    
    @ObservedObject var taskViewModel: TaskViewModel
    
    @State private var taskToAdd: Task = Task(id: 0, name: "", description: "", isActive: false, finishDate: Date())
    
    @Binding var showAddTaskView:Bool
    
    var body: some View {
        NavigationStack {
            List{
                Section(header: Text("Task Detail")){
                    TextField("Task Name", text:$taskToAdd.name
                    )
                    TextEditor(text: $taskToAdd.description)
                }
                Section(header: Text("Task Date/Time")){
                    DatePicker("Task Date", selection: $taskToAdd.finishDate)
                }
            }
            .navigationTitle("Add Task")
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading, content: {
                    Button{
                        print("Cancel ")
                        showAddTaskView = false
                    }label: {
                        Text("Cancel")
                    }
                    
                })
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    Button{
                        print("Add ")
                        showAddTaskView = false
                    }label: {
                        Text("Add")
                    }
                    
                })
            }
        }
        
        
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView(taskViewModel: TaskViewModel(),showAddTaskView: .constant(false))
    }
}
