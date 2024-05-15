//
//  HomeView.swift
//  MyTask
//
//  Created by Darshan on 15/05/24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var taskViewModel: TaskViewModel = TaskViewModel()
    @State private var pickerFilters:[String] = ["Active", "Closed"]
    @State private var defaultSelection: String = "Active"
    @State private var showAddTaskView:Bool = false
    @State private var showTaskDetailView:Bool = false
    @State private var selectedTask: Task = Task(id: 0, name: "", description: "", isActive: false, finishDate: Date())
    
    var body: some View {
        NavigationStack {
            Picker("Picker Filter",selection: $defaultSelection){
                ForEach(pickerFilters, id: \.self){
                    Text($0)
                }
            }.pickerStyle(.segmented)
                .onChange(of: defaultSelection) { newValue in
                    taskViewModel.getTasks(isActive: defaultSelection == "Active")
                }
            List(taskViewModel.tasks, id: \.id) { task in
                VStack(alignment: .leading) {
                    Text(task.name).font(.title)
                    HStack{
                        Text(task.description).font(.subheadline)
                            .lineLimit(1)
                        Spacer()
                        Text(task.finishDate.toString()).font(.subheadline)
                    }
                }.onTapGesture {
                    selectedTask = task
                    showTaskDetailView = true
                }
            }.onAppear{
                taskViewModel.getTasks(isActive: true)
            }.listStyle(.plain)
                .navigationTitle("Home")
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing, content: {
                        Button {
                            print("add task view")
                            showAddTaskView = true
                        } label: {
                            Image(systemName: "plus")
                        }
                    })
                }
                .sheet(isPresented: $showAddTaskView, content: {
                    AddTaskView(taskViewModel: taskViewModel, showAddTaskView: $showAddTaskView)
                })
                .sheet(isPresented: $showTaskDetailView, content: {
                    TaskDetailView(showTaskDetailView:$showTaskDetailView , taskDetail: $selectedTask)
                })
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
