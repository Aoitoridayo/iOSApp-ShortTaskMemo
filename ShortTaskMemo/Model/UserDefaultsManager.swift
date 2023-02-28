//
//  UserDefaultsManager.swift
//  ShortTaskMemo
//
//  Created by 渡邊魁優 on 2023/02/28.
//

import Foundation

class UserDefaultsManager {
    let userDefaults = UserDefaults.standard
    //UserDefaultsに保存
    func setDefaults(tasks: [TaskModel], key: String) {
        let json = encode(tasks: tasks)
        userDefaults.set(json, forKey: key)
    }
    //UserDefaultsから取得
    func getDefaults(key: String) -> [TaskModel] {
        let json = userDefaults.string(forKey: key) ?? ""
        let tasks = decode(json: json)
        return tasks ?? []
    }
    
    //[TaskModel] -> jsonに変換
    private func encode(tasks: [TaskModel]) -> String? {
        do {
            let data = try JSONEncoder().encode(tasks)
            guard let json = String(data: data, encoding: .utf8) else {
                return nil
            }
            return json
        } catch {
            return nil
        }
    }
    
    //json -> [TaskModel]に変換
    private func decode(json: String) -> [TaskModel]? {
        do {
            guard let data = json.data(using: .utf8) else {
                return nil
            }
            let tasks = try JSONDecoder().decode([TaskModel].self, from: data)
            return tasks
        } catch {
            return nil
        }
    }
}

struct KeyManager {
    let dayTasksKey = "DayTasks_Key"
    let weekTasksKey = "WeekTasks_Key"
    let monthTasksKey = "MonthTasks_Key"
}
