//
//  ListItemView.swift
//  ShortTaskMemo
//
//  Created by 渡邊魁優 on 2023/02/27.
//

import SwiftUI

struct ListItemView: View {
    @State var task: TaskModel
    let update: (TaskModel) -> Void
    var body: some View {
        HStack {
            Text(task.text)
            Image(
                systemName: task.onFlag
                ? "flag.fill"
                : ""
            )
            .foregroundColor(Color.yellow)
        }
        .swipeActions(edge: .leading) {
            Button(action: {
                task.onFlag.toggle()
                update(task)
            }) {
                Image(systemName: "flag")
            }
            .tint(.yellow)
        }
    }
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListItemView(task: TaskModel(text: "散歩に行く", onFlag: false), update: { _ in })
    }
}
