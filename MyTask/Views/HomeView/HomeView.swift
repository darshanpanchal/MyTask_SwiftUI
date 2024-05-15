//
//  HomeView.swift
//  MyTask
//
//  Created by Darshan on 15/05/24.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var taskViewModel: TaskViewModel = TaskViewModel()
    @State private var pickerFilters:[String] = ["Active", "Closed"]
    @State private var defaultSelection: String = "Active"
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
                    
                }
            }.onAppear{
                taskViewModel.getTasks(isActive: true)
            }.listStyle(.plain)
                .navigationTitle("Home")
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
