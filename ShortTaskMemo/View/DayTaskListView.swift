//
//  DayTaskListView.swift
//  ShortTaskMemo
//
//  Created by 渡邊魁優 on 2023/02/27.
//

import SwiftUI

struct DayTaskListView: View {
    @StateObject var taskViewModel = DayTaskViewModel()
    
    var body: some View {
        ZStack {
            List {
                ForEach(taskViewModel.tasks) { task in
                    ListItemView(task: task) { newtask in
                        taskViewModel.didTapFlag(task: newtask)
                    }
                }
                .onDelete(perform: taskViewModel.delete)
            }
            PlusButton(active: taskViewModel.didTapPlusButton)
        }
        .sheet(isPresented: $taskViewModel.isAddView) {
            AddTaskView(
                save: { text in
                    taskViewModel.didTapAddViewSaveButton(text: text)
                },
                cancel: {
                    taskViewModel.didTapAddViewCancelButton()
                }
            )
        }
    }
}

struct DayTaskListView_Previews: PreviewProvider {
    static var previews: some View {
        DayTaskListView()
    }
}
