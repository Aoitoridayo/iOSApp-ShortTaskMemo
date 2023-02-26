//
//  TaskModel.swift
//  ShortTaskMemo
//
//  Created by 渡邊魁優 on 2023/02/27.
//

import Foundation

struct TaskModel: Identifiable, Codable {
    var id = UUID()
    var text: String
    var onFlag: Bool
}
