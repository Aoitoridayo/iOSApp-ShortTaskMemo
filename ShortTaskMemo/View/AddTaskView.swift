//
//  AddTaskView.swift
//  ShortTaskMemo
//
//  Created by 渡邊魁優 on 2023/02/27.
//

import SwiftUI

struct AddTaskView: View {
    @State private var text = ""
    let save: (String) -> Void
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
                    Text("タスクを入力してください")
                    TextField("（例）書類を提出する", text: $text)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 250)
                        .padding()
                    Button(action: {
                        save(text)
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
                        Text("戻る")
                    }
                }
            }
        }
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView(save: { _ in }, cancel: {})
    }
}
