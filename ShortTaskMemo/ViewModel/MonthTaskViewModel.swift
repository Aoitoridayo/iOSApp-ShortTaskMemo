//
//  MonthTaskViewModel.swift
//  ShortTaskMemo
//
//  Created by 渡邊魁優 on 2023/02/27.
//

import Foundation

class MonthTaskViewModel: ObservableObject {
    @Published var tasks: [TaskModel] = []
    @Published var isAddView = false

    func delete(offset: IndexSet) {
        self.tasks.remove(atOffsets: offset)
    }
    
    func didTapPlusButton() {
        isAddView = true
    }
    
    func didTapAddViewSaveButton(text: String) {
        self.tasks.append(TaskModel(text: text, onFlag: false))
        isAddView = false
    }
    
    func didTapAddViewCancelButton() {
        isAddView = false
    }
    
    func didTapFlag(task: TaskModel) {
        guard let index = tasks.firstIndex(where: { $0.id == task.id }) else {
            return
        }
        self.tasks[index] = task
    }
}
