//
//  EditView.swift
//  ShortTaskMemo
//
//  Created by 渡邊魁優 on 2023/03/24.
//

import SwiftUI

struct EditView: View {
    @State var task: TaskModel
    let edit: (TaskModel) -> Void
    let cancel: () -> Void
    var body: some View {
        NavigationStack {
            ZStack {
                Rectangle()
                    .frame(width: 310, height: 210)
                    .foregroundColor(Color.cyan)
                    .opacity(0.5)
                    .shadow(color: Color.gray, radius: 10, x: 0, y: 10)
                Rectangle()
                    .frame(width: 300, height: 200)
                    .cornerRadius(30)
                    .foregroundColor(Color.white)
                
                VStack {
                    Text("タスクを編集")
                    TextField("（例）書類を提出する", text: $task.text)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 250)
                        .padding()
                        .keyboardType(.emailAddress)
                    
                    Button(action: {
                        edit(task)
                    }) {
                        Text("保存")
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        cancel()
                    }) {
                        Text("back")
                    }
                }
            }
        }
    }
}

struct EditView_Previews: PreviewProvider {
    static var task = TaskModel(text: "掃除", onFlag: true)
    static var previews: some View {
        EditView(task: task ,edit: { _ in }, cancel: {})
    }
}
