//
//  ContentView.swift
//  ShortTaskMemo
//
//  Created by 渡邊魁優 on 2023/02/27.
//

import SwiftUI

struct TabItemView: View {
    enum Tabs: String, CaseIterable, Identifiable {
            case dayTaskTab = "1日でやること"
            case weekTaskTab = "1週間でやること"
            case monthTaskTab = "1ヶ月でやること"
        
            var id: Self { self }
        }
        
        init() {
            UITabBar.appearance().backgroundColor = .cyan.withAlphaComponent(0.2)
        }
    
    @State private var navigationTitle: String = Tabs.dayTaskTab.rawValue
    @State private var selectionTab: Tabs = .dayTaskTab
    
    var body: some View {
        NavigationStack {
            TabView(selection: $selectionTab) {
                DayTaskListView()
                    .tabItem {
                        VStack {
                            Image(systemName: "sun.max")
                            Text("日")
                        }
                    }
                    .tag(Tabs.dayTaskTab)
                
                WeekTaskListView()
                    .tabItem {
                        VStack {
                            Image(systemName: "calendar")
                            Text("週")
                        }
                    }
                    .tag(Tabs.weekTaskTab)
                
                MonthTaskListView()
                    .tabItem {
                        VStack {
                            Image(systemName: "moon.fill")
                            Text("月")
                        }
                    }
                    .tag(Tabs.monthTaskTab)
            }
            .navigationTitle(navigationTitle)
            .onChange(of: selectionTab) { tab in
                navigationTitle = selectionTab.rawValue
            }
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabItemView()
    }
}
