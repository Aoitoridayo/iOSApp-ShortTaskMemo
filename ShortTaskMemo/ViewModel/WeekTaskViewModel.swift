//
//  WeekTaskViewModel.swift
//  ShortTaskMemo
//
//  Created by 渡邊魁優 on 2023/02/27.
//

import Foundation

class WeekTaskViewModel: ObservableObject {
    @Published var tasks: [TaskModel] = []
    @Published var isAddView = false

    func delete(offset: IndexSet) {
        self.tasks.remove(atOffsets: offset)
        save()
    }
    
    func didTapPlusButton() {
        isAddView = true
    }
    
    func didTapAddViewSaveButton(text: String) {
        self.tasks.append(TaskModel(text: text, onFlag: false))
        isAddView = false
        save()
    }
    
    func didTapAddViewCancelButton() {
        isAddView = false
    }
    
    func didTapFlag(task: TaskModel) {
        guard let index = tasks.firstIndex(where: { $0.id == task.id }) else {
            return
        }
        self.tasks[index] = task
        sortTasks()
    }
    
    func update(task: TaskModel) {
        guard let index = tasks.firstIndex(where: { $0.id == task.id }) else {
            return
        }
        self.tasks[index] = task
    }
    
    func firstGet() {
        let userDefaults = UserDefaultsManager()
        let key = KeyManager()
        let savedTasks = userDefaults.getDefaults(key: key.weekTasksKey)
        self.tasks = savedTasks
    }
    
    private func sortTasks() {
        let onTasks = self.tasks.filter({ $0.onFlag })
        let offTasks = self.tasks.filter({ !$0.onFlag })
        self.tasks = onTasks + offTasks
        save()
    }
    
    private func save() {
        let userDefaults = UserDefaultsManager()
        let key = KeyManager()
        userDefaults.setDefaults(tasks: tasks, key: key.weekTasksKey)
    }
}
