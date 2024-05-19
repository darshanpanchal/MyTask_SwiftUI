//
//  TaskDetailView.swift
//  MyTask
//
//  Created by Darshan on 15/05/24.
//

import SwiftUI

struct TaskDetailView: View {
    
    @ObservedObject var taskViewModel: TaskViewModel
    @Binding var showTaskDetailView:Bool
    @Binding var taskDetail:Task
    @Binding var refreshTaskList:Bool

    
    var body: some View {
        NavigationStack {
            List{
                Section(header: Text("Task Detail")){
                    TextField("Task Name", text:$taskDetail.name
                    )
                    TextEditor(text: $taskDetail.description)
                    Toggle(isOn: $taskDetail.isActive) {
                        Text("Mark Complete")
                    }
                }
                Section(header: Text("Task Date/Time")){
                    DatePicker("Task Date", selection: $taskDetail.finishDate)
                }
                Section{
                    Button{
                        if(taskViewModel.deleteTask(task: taskDetail)){
                            showTaskDetailView.toggle()
                            refreshTaskList.toggle()
                        }
                    }label: {
                        Text("Delete")
                            .fontWeight(.bold)
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                    }
                }
            }
            .navigationTitle("Task Detail")
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading, content: {
                    Button{
                        print("Cancel ")
                        showTaskDetailView.toggle()
                    }label: {
                        Text("Cancel")
                    }
                })
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    Button{
                        if(taskViewModel.updateTask(task: taskDetail)){
                            showTaskDetailView.toggle()
                            refreshTaskList.toggle()
                        }
                    }label: {
                        Text("Update")
                    }
                })
            }
        }
    }
    
    struct TaskDetailView_Previews: PreviewProvider {
        static var previews: some View {
            TaskDetailView(taskViewModel: TaskViewModel(),
                           showTaskDetailView: .constant(false),
                           taskDetail: .constant(Task.createMockTasks().first!),
                           refreshTaskList: .constant(false))
        }
    }
    
}
