//
//  TaskDetailView.swift
//  MyTask
//
//  Created by Darshan on 15/05/24.
//

import SwiftUI

struct TaskDetailView: View {
    
    
    @Binding var showTaskDetailView:Bool
    @Binding var taskDetail:Task
    
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
                        print("Add ")
                        showTaskDetailView.toggle()
                    }label: {
                        Text("Update")
                    }
                })
            }
        }
    }
    
    struct TaskDetailView_Previews: PreviewProvider {
        static var previews: some View {
            TaskDetailView(showTaskDetailView: .constant(false), taskDetail: .constant(Task.createMockTasks().first!))
        }
    }
    
}
